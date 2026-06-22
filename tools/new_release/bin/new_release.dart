import 'dart:convert';
import 'dart:io';

// Publish order: least-dependent first.
const _packages = ['clerk_backend_api', 'clerk_auth', 'clerk_flutter'];
const _packagePaths = {
  'clerk_backend_api': 'packages/clerk_backend_api',
  'clerk_auth': 'packages/clerk_auth',
  'clerk_flutter': 'packages/clerk_flutter',
};

Future<void> main(List<String> args) async {
  if (args.isEmpty || args.contains('--help') || args.contains('-h')) {
    _usage();
    exit(args.isEmpty ? 1 : 0);
  }

  final bumpType = args[0];
  if (!{'patch', 'minor', 'major'}.contains(bumpType)) {
    stderr.writeln('Error: unknown bump type "$bumpType"');
    _usage();
    exit(1);
  }

  String? preId;
  for (int i = 1; i < args.length; i++) {
    if (args[i].startsWith('--pre=')) {
      preId = args[i].substring('--pre='.length);
    } else if (args[i] == '--pre' && i + 1 < args.length) {
      preId = args[++i];
    }
  }

  final root = Directory.current.path;

  print('--- Bumping versions '
      '($bumpType${preId != null ? ' --pre=$preId' : ''}) ---');

  // 1. Update pubspec.yaml for all packages.
  String? newVersion;
  for (final pkg in _packages) {
    final file = File('$root/${_packagePaths[pkg]!}/pubspec.yaml');
    final content = await file.readAsString();
    final current = _extractVersion(content);
    final bumped = _bumpVersion(current, bumpType, preId);
    newVersion ??= bumped;

    await file.writeAsString(
      content.replaceFirst(
        RegExp(r'^version: .+$', multiLine: true),
        'version: $bumped',
      ),
    );
    print('  $pkg: $current → $bumped');
  }

  // 2. Sync pubVersion in openapi-generator-config.json.
  final openapiConfig =
      File('$root/openapi_generator/openapi-generator-config.json');
  if (openapiConfig.existsSync()) {
    final json =
        jsonDecode(await openapiConfig.readAsString()) as Map<String, dynamic>;
    json['pubVersion'] = newVersion;
    await openapiConfig.writeAsString(
        const JsonEncoder.withIndent('    ').convert(json) + '\n');
    print('  openapi_generator/openapi-generator-config.json');
  }

  // 3. Regenerate _version.dart via build_runner.
  print('\n--- Running build_runner for clerk_auth ---');
  final buildResult = await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    workingDirectory: '$root/packages/clerk_auth',
  );
  if (buildResult.exitCode != 0) {
    stderr.writeln('build_runner failed:\n${buildResult.stderr}');
    exit(1);
  }
  print('  packages/clerk_auth/lib/src/_version.dart regenerated');

  // 4. Prepend changelog entries for each package.
  print('\n--- Generating changelogs ---');
  for (final pkg in _packages) {
    await _generateChangelog(root, pkg, _packagePaths[pkg]!, newVersion!);
  }

  // 5. Stage specific files and commit.
  print('\n--- Committing ---');
  await _commit(root, newVersion!);

  print('\nDone! Created commit: chore: release v$newVersion');
  print('Next: push branch, open PR, merge to main, then run:');
  print('  git checkout main && git pull && melos run tag');
}

void _usage() {
  print('Usage: dart tools/new_release/bin/new_release.dart <patch|minor|major>'
      ' [--pre=<id>]');
  print('');
  print('Examples:');
  print('  patch --pre=beta   # 0.0.16-beta → 0.0.17-beta');
  print('  minor              # 0.0.17-beta → 0.1.0');
}

String _extractVersion(String pubspec) {
  final m = RegExp(r'^version:\s*(.+)$', multiLine: true).firstMatch(pubspec);
  if (m == null) throw Exception('No version field found in pubspec.yaml');
  return m.group(1)!.trim();
}

// Strips the existing pre-release suffix, applies the bump, then reattaches
// preId (if provided). This matches Cider's --pre behaviour.
String _bumpVersion(String current, String bumpType, String? preId) {
  final dashIdx = current.indexOf('-');
  final base = dashIdx >= 0 ? current.substring(0, dashIdx) : current;
  final parts = base.split('.').map(int.parse).toList();

  switch (bumpType) {
    case 'major':
      parts[0]++;
      parts[1] = 0;
      parts[2] = 0;
    case 'minor':
      parts[1]++;
      parts[2] = 0;
    case 'patch':
      parts[2]++;
  }

  final newBase = parts.join('.');
  return preId != null ? '$newBase-$preId' : newBase;
}

Future<void> _generateChangelog(
  String root,
  String pkgName,
  String pkgPath,
  String newVersion,
) async {
  // Find the most recent per-package tag to use as the git log base.
  final tagResult = await Process.run(
    'git',
    ['tag', '--list', '$pkgName-v*', '--sort=-version:refname'],
    workingDirectory: root,
  );
  final tags = (tagResult.stdout as String)
      .split('\n')
      .map((t) => t.trim())
      .where((t) => t.isNotEmpty)
      .toList();

  final gitLogArgs = [
    'log',
    if (tags.isNotEmpty) '${tags.first}..HEAD',
    '--oneline',
    '--no-merges',
    '--',
    pkgPath,
  ];

  final logResult =
      await Process.run('git', gitLogArgs, workingDirectory: root);
  final commits = (logResult.stdout as String)
      .split('\n')
      .map((l) => l.trim())
      .where((l) => l.isNotEmpty)
      .toList();

  if (commits.isEmpty) {
    print('  $pkgName: no new commits — CHANGELOG unchanged');
    return;
  }

  final entries = commits.map((line) {
    final msg = line.replaceFirst(RegExp(r'^[0-9a-f]{6,}\s+'), '');
    return _formatEntry(msg, pkgName);
  }).toList();

  final changelogFile = File('$root/$pkgPath/CHANGELOG.md');
  final existing =
      changelogFile.existsSync() ? await changelogFile.readAsString() : '';

  final section =
      '## $newVersion\n\n${entries.map((e) => ' - $e').join('\n')}\n\n';
  await changelogFile.writeAsString(section + existing);
  print(
      '  $pkgName: ${entries.length} entr${entries.length == 1 ? 'y' : 'ies'}');
}

// Converts a commit message to the Melos-style bold-label format:
//   fix(clerk_auth): fix something (#42) → **FIX**(clerk_auth): fix something (#42).
String _formatEntry(String message, String pkgName) {
  final re = RegExp(
    r'^(feat|fix|docs|chore|refactor|test|style|perf|ci|build|revert)'
    r'(\(([^)]+)\))?!?:\s*(.+)$',
  );
  final m = re.firstMatch(message);
  if (m == null) return message;

  final type = m.group(1)!.toUpperCase();
  final scope = m.group(3) ?? pkgName;
  var desc = m.group(4)!;

  // Normalise bare #NNN → (#NNN).
  final bareRef = RegExp(r'\s*#(\d+)$');
  final parenRef = RegExp(r'\s*\(#\d+\)$');
  if (!parenRef.hasMatch(desc)) {
    final bare = bareRef.firstMatch(desc);
    if (bare != null) {
      desc = '${desc.substring(0, bare.start)} (#${bare.group(1)})';
    }
  }

  if (!desc.endsWith('.')) desc = '$desc.';
  return '**$type**($scope): $desc';
}

Future<void> _commit(String root, String version) async {
  final filesToStage = [
    'packages/clerk_auth/pubspec.yaml',
    'packages/clerk_auth/CHANGELOG.md',
    'packages/clerk_auth/lib/src/_version.dart',
    'packages/clerk_backend_api/pubspec.yaml',
    'packages/clerk_backend_api/CHANGELOG.md',
    'packages/clerk_flutter/pubspec.yaml',
    'packages/clerk_flutter/CHANGELOG.md',
    'openapi_generator/openapi-generator-config.json',
  ];

  final addResult = await Process.run(
    'git',
    ['add', ...filesToStage],
    workingDirectory: root,
  );
  if (addResult.exitCode != 0) {
    stderr.writeln('git add failed:\n${addResult.stderr}');
    exit(1);
  }

  final commitResult = await Process.run(
    'git',
    ['commit', '-m', 'chore: release v$version'],
    workingDirectory: root,
  );
  if (commitResult.exitCode != 0) {
    stderr.writeln('git commit failed:\n${commitResult.stderr}');
    exit(1);
  }
  print('  chore: release v$version');
}

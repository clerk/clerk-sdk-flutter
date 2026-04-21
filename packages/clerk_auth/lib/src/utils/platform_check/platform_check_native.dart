/// `true` when running on web, `false` otherwise.
///
/// This is the native (non-web) implementation, selected by the conditional
/// export in `platform_check.dart` when `dart.library.js_interop` is NOT
/// available.
bool get isWeb => false;

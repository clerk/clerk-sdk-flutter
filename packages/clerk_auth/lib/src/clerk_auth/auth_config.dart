import 'package:clerk_auth/src/clerk_auth/auth.dart';
import 'package:clerk_auth/src/clerk_auth/http_service.dart';
import 'package:clerk_auth/src/clerk_auth/persistor.dart';
import 'package:clerk_auth/src/clerk_auth/sdk_flags.dart';
import 'package:clerk_auth/src/models/enums.dart';
import 'package:meta/meta.dart';

/// Used by [Api] to locate the current user locale preference.
typedef LocalesLookup = List<String> Function();

/// An object holding all configurable items required for [Auth], with
/// sensible defaults
///
@immutable
class AuthConfig {
  /// Construct an [AuthConfig]
  const AuthConfig({
    required this.publishableKey,
    required this.persistor,
    this.flags = const SdkFlags(),
    SessionTokenPollMode? sessionTokenPollMode,
    LocalesLookup? localesLookup,
    bool? isTestMode,
    String? telemetryEndpoint,
    Duration? telemetryPeriod,
    Duration? clientRefreshPeriod,
    HttpService? httpService,
  })  : sessionTokenPollMode =
            sessionTokenPollMode ?? SessionTokenPollMode.lazy,
        localesLookup = localesLookup ?? Auth.defaultLocalesLookup,
        isTestMode = isTestMode ?? false,
        telemetryEndpoint =
            telemetryEndpoint ?? 'https://clerk-telemetry.com/v1/event',
        telemetryPeriod =
            telemetryPeriod ?? const Duration(milliseconds: 29300),
        clientRefreshPeriod =
            clientRefreshPeriod ?? const Duration(milliseconds: 9700),
        httpService = httpService ?? const DefaultHttpService();

  /// Key from the Clerk dashboard identifying the auth service account
  final String publishableKey;

  /// The [Persistor] used for various state storage
  final Persistor persistor;

  /// Flags used to affect behaviour
  final SdkFlags flags;

  /// the mode by which session tokens are polled from the back end
  final SessionTokenPollMode sessionTokenPollMode;

  /// Function to return list of current user's locales for translation
  final LocalesLookup localesLookup;

  /// Are we in test mode?
  final bool isTestMode;

  /// The endpoint to hit when sending telemetry data
  final String telemetryEndpoint;

  /// The duration between sends of telemetry data
  /// Default is 29300ms: about 30s, but not exactly on the button to
  /// avoid repeated clashes with other regular tasks
  ///
  /// Set to [Duration.zero] to switch off sending telemetry data
  ///
  final Duration telemetryPeriod;

  /// The duration between calls to refresh the client object
  /// Default is 9700ms: about 10s, but not exactly on the button to
  /// avoid repeated clashes with other regular tasks
  ///
  /// Set to [Duration.zero] to switch off client refresh polling
  ///
  final Duration clientRefreshPeriod;

  /// The [HttpService] used to communicate with the backend.
  final HttpService httpService;

  /// Initialise
  Future<void> initialize() async {
    await persistor.initialize();
    await httpService.initialize();
  }

  /// Terminate
  void terminate() {
    httpService.terminate();
    persistor.terminate();
  }
}

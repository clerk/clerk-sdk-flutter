// Platform-aware web detection for `clerk_auth`.
//
// Re-exports a top-level `isWeb` getter that is `true` when the SDK is
// running in a web browser and `false` otherwise. Uses Dart conditional
// imports — selected at compile time based on whether `dart.library.js_interop`
// is available — so the check is correct under both `dart2js` and `dart2wasm`.
// (`identical(0, 0.0)` is dart2js-only and gives the wrong answer on WASM.)
export 'platform_check_native.dart'
    if (dart.library.js_interop) 'platform_check_web.dart';

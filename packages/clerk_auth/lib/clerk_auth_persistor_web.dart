// Separate entry point for the web DefaultPersistor.
//
// This file cannot be exported from `clerk_auth.dart` because it depends on
// `package:web`, which is unavailable on native platforms. Web-only consumers
// (e.g. `default_caching_persistor_web.dart`) import this directly.
export 'src/clerk_auth/persistor/default_persistor_web.dart';

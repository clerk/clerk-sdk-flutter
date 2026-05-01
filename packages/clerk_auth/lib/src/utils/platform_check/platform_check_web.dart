/// `true` when running on web, `false` otherwise.
///
/// This is the web implementation, selected by the conditional export in
/// `platform_check.dart` when `dart.library.js_interop` IS available
/// (i.e. dart2js or dart2wasm).
bool get isWeb => true;

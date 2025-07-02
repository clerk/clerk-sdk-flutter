## 0.0.10-beta

* feat: allow app-defined redirects aka deep-links (with example) [#170]
* feat: add password reset flow [#161]
* feat: clear cookies on sign out [#188]
* feat: refactor identifier input [#197]
* feat: add offline support [#200]
* feat: grammatical sentence formatting [#192]

See changes made in `clerk_auth` package as part of this release.

## 0.0.9-beta

* feat: support fall-back localization default English [#163]
* fix: update user agent to support desktop/mobile modes [#166]

## 0.0.8-beta

* feat: add generated clerk_backend_api package [#82]
* feat: implement organizations [#150] 

## 0.0.7-dev

* fix: rationalise clerk auth exports [#105]
* fix: session token broken [#97]
* feat: enable session tokens to be created and updated per organization [#97]
* fix: enable telemetry to be disabled and endpoint to be set from env [#97]
* fix: allow telemetry period to be set from environment too [#97]
* fix: add check for malformed jwt into session token [#97]
* feat: add external accounts to user profile and start connect account journey [#118]
* fix: bugs in sign up flow [#127]
* fix: add failed status to enum [#112]
* feat: enable `sessionToken()` to return templated JWT tokens for external vendors. [#93]
* fix: improve multilingual support [#128]
* fix: connecting a new account [#121]
* fix: surface server errors in the ui [#122] 
* feat: replace parameters with config object [#120]
* fix: amalgamate Closeable and AnimatedCloseable [#138]
* fix: add translations for sign in error [#143]
* fix: mark all models as immutable [#113] 
* fix: add toString to models [#140]
* fix: refactor attemptSignIn [#147]
* fix: refactor HttpService [#149]
* feat: add timeouts to loading overlay [#142]
* feat: custom sign in example [#141]

## 0.0.6-dev

- Improve updateUser to utilise environment config #98
- Fix ClerkAuthState missing after telemetry addition #102

## 0.0.5-dev

- Lower flutter version to 3.10.0 #41
- Remove usage of public_key #45
- Add data/state persistor #46
- Add user profile editing #55
- Switch add account routing from overlays to routes #58
- Resolve issues in UI when strategies are missing #65
- Add telemetry support #81
- Remove dependency on inset-box-shadow #87
- Rename ClerkAuthProvider to ClerkAuthState to clarify its usage #99

## 0.0.4-dev

- Improved SSO popup user experience #33
- Updated async initialisation and token refresh #42
- Added documentation #36
- Improved formatting for pub score #34 #35

## 0.0.3-dev

- Pre-release alpha.

## 0.0.2-dev

- Pre-alpha development.

## 0.0.1

- Pre-alpha version.

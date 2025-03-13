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
- Disable bot protection #66
- Remove favicon_image from display_config #88
- Upload images using byte arrays #79
- Add telemetry support #81

## 0.0.4-dev

- Updated token expiration to use UTC #47
- Added regular poll for session token (optional) #42
- Added documentation #36
- Improved formatting for pub score #34 #35

## 0.0.3-dev

- Pre-release alpha.

## 0.0.2-dev

- Pre-alpha development.

## 0.0.1

- Pre-alpha version.

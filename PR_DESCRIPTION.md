# Fix premature signed-out UI flash on slow networks (Hydration-aware auth state)

## Problem

When using `clerk_flutter` on **low/unstable internet connections**, users who are already signed in see the **signed-out UI first** (login screen) before the auth state resolves and the signed-in UI appears. This flash of the wrong UI can completely disrupt the user experience.

### Root Cause

The core issue stems from how the initial session fetch behaves on slow networks combined with the lack of hydration awareness in `ClerkAuthBuilder`:

1. App starts → `ClerkAuth` initializes and attempts the first API call to fetch the session.
2. If the network is slow or unstable, **this first API call can fail or time out**.
3. Upon failure, the `client` and `environment` are not fully populated.
4. `ClerkAuthBuilder` simply checks `client.user`, which evaluates to `null`.
5. **`signedOutBuilder` fires → user sees the login screen** even though they have a valid session.
6. The built-in retry mechanism doesn't attempt another fetch for **10 seconds**, leaving the user stuck on the login screen, thinking they have been logged out.

The existing `ClerkAuthBuilder` has **no concept of "hydration"** — it simply checks whether `client.user` is null or not, with no way to distinguish between "not yet loaded successfully" and "genuinely signed out".

---

## Solution Overview

This PR fixes the premature signed-out flash by introducing a hydration-aware state and implementing an exponential backoff retry mechanism for the initial session fetch.

The solution introduces three key concepts:

1. **`HydratedClerkAuthState`** — A subclass of `ClerkAuthState` that accurately tracks whether auth initialization (hydration) has completed successfully.
2. **Exponential Backoff Retries** — If the initial fetch fails (e.g., due to a slow network timeout), the state now retries fetching the session using an exponential backoff strategy (1s, 3s, 5s) instead of waiting 10 seconds.
3. **`CustomClerkAuthBuilder`** — A hydration-aware replacement for `ClerkAuthBuilder` that uses `HydratedClerkAuthState`. It displays a loading widget until hydration either completes successfully or exhausts its retries, completely preventing the signed-out flash.

---

## Summary of ALL Changes

| File | Change Type | What Changed |
|---|---|---|
| `lib/src/clerk_auth_state.dart` | Modified | Added `HydrationSource` enum and `HydratedClerkAuthState` class with built-in exponential backoff retries (1s, 3s, 5s). Modified `update()` to handle late hydration. |
| `lib/src/widgets/control/custom_clerk_auth_builder.dart` | **New file** | Introduced `CustomClerkAuthBuilder` widget to show a loading state while hydration is incomplete. Added `HydrationEvent` for observability. |
| `lib/src/widgets/control/clerk_auth.dart` | Modified | Updated `_ClerkAuthState.initState()` to construct `HydratedClerkAuthState.createUninitialized()` and process the initialization async using `scheduleMicrotask` to avoid blocking the UI. |
| `lib/clerk_flutter.dart` | Modified | Exported `src/widgets/control/custom_clerk_auth_builder.dart`. |

---

## Testing

1. **Fast network**: App should start with a brief loading indicator then show the correct auth screen (signed-in or signed-out). No flash of wrong screen.
2. **Slow network (throttle to 3G)**: The initial API call might fail or take time. App shows loading indicator for the duration of hydration (including any required retries). Once hydrated, shows correct screen. No login screen flash.
3. **Offline then online**: App shows loading indicator. After exponential retries (1s, 3s, 5s delays), if network returns, app hydrates and shows correct screen. If all retries fail, it gracefully falls back.
4. **Existing `ClerkAuthBuilder` usage**: Should still work exactly as before (no breaking changes).
5. **`onHydrationEvent` callback**: Emits telemetry events at each stage of hydration (`beforeInitialize`, `afterInitialize`, `afterRefresh`, or `refreshError`).

# Exploring Experimental and Exploratory Platforms

Learn about platforms where Swift support is under active development.

## Overview

Beyond the Tier 1 platforms,
the Swift community is actively developing support
for additional platforms.
These platforms are at various stages of maturity ---
some are nearing Tier 2 status
while others are early-stage experiments.

For an explanation of what each tier means,
see <doc:SupportTiers>.

### Cross-compilation targets

The following platforms are available as cross-compilation targets.
You build your code on a Tier 1 toolchain host
and produce binaries for the target platform.

#### Android

Swift provides a cross-compilation SDK for Android.
Development snapshots are available alongside official Swift releases.

| Detail | Value |
|---|---|
| Minimum deployment version | Android 9 (API 28) |
| Build from | macOS or Linux toolchain host |

The Android SDK supports the following target triples:

| Triple | Architecture |
|---|---|
| `aarch64-unknown-linux-android28` | arm64 |
| `x86_64-unknown-linux-android28` | x86_64 |

See [Getting started with the Swift SDK for Android](https://www.swift.org/documentation/articles/swift-sdk-for-android-getting-started.html)
for setup instructions.

#### WebAssembly

Swift can compile to WebAssembly for use
in browser and server-side Wasm runtimes.
A WebAssembly SDK is available as part of Swift's development snapshots
and official releases.

The WebAssembly SDK supports the following target triples:

| Triple | Environment |
|---|---|
| `wasm32-unknown-wasi` | WASI (WebAssembly System Interface) |
| `wasm32-unknown-wasip1` | WASI preview 1 |
| `wasm32-unknown-wasip1-threads` | WASI preview 1 with threads |

#### Embedded Swift

Swift's Embedded language mode
targets resource-constrained environments
such as microcontrollers and bare-metal systems.

| Triple | Target |
|---|---|
| `armv7em-none-none-eabi` | ARM Cortex-M microcontrollers |

> Note: Embedded Swift uses a subset of the Swift language.
> Not all standard library features are available
> in this mode.

### Propose a new platform

Community members can propose adding platforms
at any tier level.
For details about the proposal process,
see <doc:SupportTiers>.

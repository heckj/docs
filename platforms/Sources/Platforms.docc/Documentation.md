# ``Platforms``

Learn where Swift runs, what tools are available on each platform,
and what level of support to expect.

## Overview

Swift supports multiple platforms at different levels.
Each platform falls into one of three support tiers that
indicate the maturity of Swift on that platform
and the level of commitment the Swift project makes to maintaining it.

Swift organizes platform support into three tiers:

- Tier 1 --- Primary support
- Tier 2 --- Experimental
- Tier 3 --- Exploratory

For Tier 1 support, the Swift project provides official toolchain builds,
runs continuous integration testing,
and treats regressions on these platforms as release-blocking issues.
The Swift community shares collective responsibility
for maintaining support on Tier 1 platforms.
For more information on the tiers of support, read <doc:SupportTiers>.

The tables below summarize which platforms Swift supports today
and what you can do on each one.

#### Development and deployment

You can both develop and run Swift programs on these platforms.
Each one includes the Swift compiler as part of its toolchain.

| Platform | Architectures | Minimum version |
|---|---|---|
| macOS | arm64, x86_64 | 10.13 |
| Ubuntu | x86_64, aarch64 | 22.04 |
| Debian | x86_64, aarch64 | 12 |
| Fedora | x86_64, aarch64 | 39 |
| Amazon Linux | x86_64, aarch64 | 2 |
| Red Hat UBI | x86_64, aarch64 | 9 |
| Windows | x86_64, arm64 | 10.0 |

For details about specific Linux distributions and versions,
see <doc:LinuxPlatforms>.

#### Deployment only

You can compile Swift programs that target these platforms,
but the Swift compiler itself does not run on them.
Build your code on a toolchain host such as macOS
and deploy the resulting binary to the target platform.

| Platform | Architectures | Minimum deployment version |
|---|---|---|
| iOS | arm64 | 11.0 |
| watchOS | arm64 | 4.0 |
| tvOS | arm64 | 11.0 |

For more information about Apple platform targets,
see <doc:ApplePlatforms>.

#### Development tools

The following table shows which tools are available
on platforms that support Swift development.

| Hosting Platform | Swift Package Manager | SourceKit-LSP | Debugger | DocC | REPL |
|---|---|---|---|---|---|
| macOS | Yes | Yes | Yes | Yes | Yes |
| Linux | Yes | Yes | Yes | Yes | Yes |
| Windows | Yes | Yes | Yes | — | — |

### Cross-compilation SDKs

Swift provides cross-compilation SDKs that let you build
Swift programs on one platform and run them on another.
These SDKs are available as development snapshots
alongside official Swift releases.

- **Static Linux SDK** ---
  Build fully statically linked binaries for Linux.
  Uses the Musl C library.
  See [Getting started with the Static Linux SDK](https://www.swift.org/documentation/articles/static-linux-getting-started.html)
  for setup instructions.

- **Android SDK** ---
  Build Swift programs that run on Android devices.
  See [Getting started with the Swift SDK for Android](https://www.swift.org/documentation/articles/swift-sdk-for-android-getting-started.html)
  for setup instructions.

- **WebAssembly SDK** ---
  Compile Swift to WebAssembly for browser and server-side Wasm runtimes.

### Experimental and exploratory platforms

Platforms beyond Tier 1 are at various stages of development.
For information about Tier 2 and Tier 3 platforms,
see <doc:ExperimentalPlatforms>.

## Topics

### Platform Support

- <doc:SupportTiers>
- <doc:ApplePlatforms>
- <doc:LinuxPlatforms>
- <doc:WindowsPlatform>
- <doc:ExperimentalPlatforms>

### Platform Reference

- <doc:PlatformReference>
- <doc:PlatformOwners>

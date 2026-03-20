# Reviewing Platform Support Details

Find the complete list of supported LLVM target triples,
component availability, and minimum version requirements
for every Swift platform.

## Overview

This article provides a comprehensive reference
of all platforms and target triples that Swift supports.
For a higher-level overview,
see <doc:Platforms>.

### Tier 1 toolchain host triples

These triples identify platforms where you can run
the full Swift development toolchain ---
the compiler, Swift Package Manager, SourceKit-LSP,
and the LLDB debugger.

| Triple | Platform | Min version |
|---|---|---|
| `arm64-apple-macosx` | macOS on Apple silicon | 10.13 |
| `x86_64-apple-macosx` | macOS on Intel | 10.13 |
| `x86_64-unknown-linux-gnu` | Linux (x86_64) | See <doc:LinuxPlatforms> |
| `aarch64-unknown-linux-gnu` | Linux (aarch64) | See <doc:LinuxPlatforms> |
| `x86_64-unknown-windows-msvc` | Windows (x86_64) | 10.0 |
| `aarch64-unknown-windows-msvc` | Windows (arm64) | 10.0 |

### Tier 1 deployment-only triples

These triples identify platforms
that you can target from a toolchain host.
The Swift compiler does not run natively on these platforms.

| Triple | Platform | Min deployment version |
|---|---|---|
| `arm64-apple-ios` | iOS | 11.0 |
| `arm64-apple-watchos` | watchOS | 4.0 |
| `arm64-apple-tvos` | tvOS | 11.0 |

### Cross-compilation SDK triples

These triples are used with Swift cross-compilation SDKs.
Build on a Tier 1 toolchain host
and produce binaries for the target platform.

#### Static Linux SDK

| Triple | Architecture |
|---|---|
| `x86_64-swift-linux-musl` | x86_64 |
| `aarch64-swift-linux-musl` | aarch64 |

#### Android SDK

| Triple | Architecture |
|---|---|
| `aarch64-unknown-linux-android28` | arm64 |
| `x86_64-unknown-linux-android28` | x86_64 |

#### WebAssembly SDK

| Triple | Environment |
|---|---|
| `wasm32-unknown-wasi` | WASI |
| `wasm32-unknown-wasip1` | WASI preview 1 |
| `wasm32-unknown-wasip1-threads` | WASI preview 1 with threads |

#### Embedded Swift

| Triple | Target |
|---|---|
| `armv7em-none-none-eabi` | ARM Cortex-M microcontrollers |

### Development tool availability

This table summarizes which development tools
are available on each toolchain host platform.

| Platform | SPM | SourceKit-LSP | LLDB | DocC | REPL |
|---|---|---|---|---|---|
| macOS | Yes | Yes | Yes | Yes | Yes |
| Linux (all distributions) | Yes | Yes | Yes | Yes | Yes |
| Windows | Yes | Yes | Yes | — | — |

### Deployment target capabilities

This table summarizes runtime capabilities
on deployment-only platforms.

| Platform | Debugger | REPL |
|---|---|---|
| iOS | Yes | — |
| watchOS | Yes | — |
| tvOS | Yes | — |

### Linux distribution support matrix

The following table lists
which Linux distributions and versions
have official Swift toolchain builds for Swift 6.2.

| Distribution | Version | x86_64 | aarch64 |
|---|---|---|---|
| Ubuntu | 24.04 | Yes | Yes |
| Ubuntu | 22.04 | Yes | Yes |
| Debian | 12 | Yes | Yes |
| Fedora | 41 | Yes | Yes |
| Fedora | 39 | Yes | Yes |
| Amazon Linux | 2 | Yes | Yes |
| Red Hat UBI | 9 | Yes | Yes |

> Note: The set of supported distributions
> and versions changes across Swift releases.
> Ubuntu 20.04 support was removed in Swift 6.2.
> Fedora 41 support was added in Swift 6.2.4.

### Understand target triples

A target triple is a string that tells the Swift compiler
what kind of binary to produce.
It follows the format: `architecture-vendor-os-environment`.

For example, in `x86_64-unknown-linux-gnu`:

- `x86_64` --- the CPU architecture
- `unknown` --- the vendor (generic)
- `linux` --- the operating system
- `gnu` --- the environment (glibc-based)

Some triples include additional information,
such as a minimum deployment version (`arm64-apple-macosx15.0`)
or an API level (`aarch64-unknown-linux-android28`).

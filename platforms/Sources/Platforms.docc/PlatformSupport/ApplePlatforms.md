# Developing for Apple Platforms

Review the Apple platforms that Swift supports,
including deployment targets and available tools.

## Overview

Apple platforms are Tier 1 platforms for Swift.
macOS serves as a toolchain host ---
you run the Swift compiler on macOS
and deploy to macOS itself as well as to iOS, watchOS, and tvOS.

The Xcode toolchain provides the compiler, debugger,
Swift Package Manager, and SourceKit-LSP on macOS.

### macOS

macOS supports both development and deployment.

| Detail | Value |
|---|---|
| Architectures | arm64, x86_64 |
| Minimum deployment version | 10.13 |
| Toolchain host | Yes |

#### Available tools on macOS

| Tool | Available |
|---|---|
| Swift compiler | Yes |
| Swift Package Manager | Yes |
| SourceKit-LSP | Yes |
| Debugger (LLDB) | Yes |
| REPL | Yes |

### iOS

iOS is a deployment-only platform.
Build your iOS apps on macOS and deploy to devices or simulators.

| Detail | Value |
|---|---|
| Architectures | arm64 |
| Minimum deployment version | 11.0 |
| Debugger | Yes |

### watchOS

watchOS is a deployment-only platform.

| Detail | Value |
|---|---|
| Architectures | arm64 |
| Minimum deployment version | 4.0 |
| Debugger | Yes |

### tvOS

tvOS is a deployment-only platform.

| Detail | Value |
|---|---|
| Architectures | arm64 |
| Minimum deployment version | 11.0 |
| Debugger | Yes |

### Platform owner

| | Details |
|---|---|
| Owner | [Apple Inc.](https://www.apple.com) |
| Getting started | [Install Swift on macOS](https://www.swift.org/install/macos/) |
| PR testing required | Yes |

### LLVM target triples

The following triples identify Apple platforms
when cross-compiling or specifying a deployment target.

| Triple | Platform |
|---|---|
| `arm64-apple-macosx` | macOS on Apple silicon |
| `x86_64-apple-macosx` | macOS on Intel |
| `arm64-apple-ios` | iOS devices |
| `arm64-apple-watchos` | watchOS devices |
| `arm64-apple-tvos` | tvOS devices |

> Note: Xcode may append a minimum deployment version
> to the triple, such as `arm64-apple-macosx15.0`.
> The unversioned form identifies the platform in general.

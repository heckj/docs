# Building with Swift on Windows

Review Windows platform support,
available architectures, and current toolchain capabilities.

## Overview

Windows is a Tier 1 platform for Swift.
The Swift project provides official toolchain builds
for Windows on both x86_64 and arm64 architectures.
The toolchain includes the Swift compiler,
Swift Package Manager, SourceKit-LSP, and the LLDB debugger.

### Supported versions

| Detail | Value |
|---|---|
| Minimum version | Windows 10.0 |
| Architectures | x86_64, arm64 |
| Toolchain host | Yes |

Windows arm64 toolchain builds
have been available since Swift 6.0.3.

### Available tools

| Tool | Available |
|---|---|
| Swift compiler | Yes |
| Swift Package Manager | Yes |
| SourceKit-LSP | Yes |
| Debugger (LLDB) | Yes |
| DocC | — |
| REPL | — |

The Swift REPL and DocC are not currently available on Windows.

### Installation methods

Swift on Windows can be installed using several methods:

- **WinGet** --- The recommended method using the Windows Package Manager.
- **Manual installer** --- A downloadable installer package.
- **Container images** --- Official Docker images for containerized builds.

See the [Install Swift on Windows](https://www.swift.org/install/windows/) page
for detailed instructions.

### Platform owner

| | Details |
|---|---|
| Owner | [Apple Inc.](https://www.apple.com) |
| Getting started | [Install Swift on Windows](https://www.swift.org/install/windows/) |
| PR testing required | Yes |

### LLVM target triple

| Triple | Architecture |
|---|---|
| `x86_64-unknown-windows-msvc` | x86_64 |
| `aarch64-unknown-windows-msvc` | arm64 |

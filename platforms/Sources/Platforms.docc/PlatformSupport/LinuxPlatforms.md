# Building with Swift on Linux

Understand which Linux distributions Swift supports,
available architectures, and toolchain components.

## Overview

Linux is a Tier 1 platform for Swift.
The Swift project provides official toolchain builds
for specific distributions and architectures.
All supported Linux distributions include the Swift compiler,
Swift Package Manager, SourceKit-LSP, LLDB debugger, and the Swift REPL.

### Supported distributions

The following Linux distributions have
official Swift toolchain builds available from swift.org.
Both x86_64 and aarch64 architectures are supported
for all listed distributions.

#### Ubuntu

| Version | Architectures | Notes |
|---|---|---|
| 24.04 (Noble Numbat) | x86_64, aarch64 | |
| 22.04 (Jammy Jellyfish) | x86_64, aarch64 | |

Ubuntu 20.04 was supported through Swift 6.1
but is not included in Swift 6.2 and later releases.

#### Debian

| Version | Architectures |
|---|---|
| 12 (Bookworm) | x86_64, aarch64 |

#### Fedora

| Version | Architectures | Notes |
|---|---|---|
| 41 | x86_64, aarch64 | |
| 39 | x86_64, aarch64 | |

The set of supported Fedora versions changes
as Fedora releases reach end of life.

#### Amazon Linux

| Version | Architectures |
|---|---|
| 2 | x86_64, aarch64 |

#### Red Hat Universal Base Image

| Version | Architectures |
|---|---|
| 9 | x86_64, aarch64 |

### Available tools

Every supported Linux distribution includes the same set of development tools.

| Tool | Available |
|---|---|
| Swift compiler | Yes |
| Swift Package Manager | Yes |
| SourceKit-LSP | Yes |
| Debugger (LLDB) | Yes |
| REPL | Yes |

### Static Linux SDK

The Static Linux SDK lets you build
fully statically linked Linux binaries from any toolchain host.
Static binaries built with this SDK use the Musl C library
and do not depend on the host distribution's shared libraries.

The Static Linux SDK uses distinct target triples:

| Triple | Architecture |
|---|---|
| `x86_64-swift-linux-musl` | x86_64 |
| `aarch64-swift-linux-musl` | aarch64 |

See [Getting started with the Static Linux SDK](https://www.swift.org/documentation/articles/static-linux-getting-started.html)
for setup instructions.

### Container images

Official Swift Docker images are available for supported distributions.
These provide a convenient way to build and test Swift code
in a containerized Linux environment.

See the [Install Swift on Linux](https://www.swift.org/install/linux/) page
for container options and instructions.

### Platform owner

| | Details |
|---|---|
| Owner | [Apple Inc.](https://www.apple.com) |
| Getting started | [Install Swift on Linux](https://www.swift.org/install/linux/) |
| PR testing required | Yes |

### LLVM target triples

The following triples identify Linux platforms
when cross-compiling or specifying a target.

| Triple | Distribution |
|---|---|
| `x86_64-unknown-linux-gnu` | All supported distributions (x86_64) |
| `aarch64-unknown-linux-gnu` | All supported distributions (aarch64) |
| `x86_64-swift-linux-musl` | Static Linux SDK (x86_64) |
| `aarch64-swift-linux-musl` | Static Linux SDK (aarch64) |

> Note: Linux distributions that use glibc
> share the same target triple for a given architecture.
> The triple does not distinguish between distributions ---
> the same `x86_64-unknown-linux-gnu` triple applies
> to Ubuntu, Debian, Fedora, Amazon Linux, and Red Hat UBI.

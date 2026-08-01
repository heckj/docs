# Porting Swift Packages to Windows

Adapt existing Swift packages so they build and run on Windows.

<!--
Draft outline — headings + one-line nuggets, not final prose yet.
Every non-hypothesis bullet is backed by a source opened directly during drafting.
-->

## Overview

- Most portable Swift code (business logic, algorithms, Foundation-based
  networking and parsing) needs little to no change on Windows. The sections
  below are the deltas that actually affect package authors moving to Windows.

## Static and dynamic linking work differently

- Windows doesn't yet support fully static-linked Swift binaries the way some
  other platforms do — don't assume you can ship a single statically-linked
  executable. Passing `--static-swift-stdlib` currently produces an error
  under the Swift Build system on Windows, pending static-library support.
  ([tracking issue](https://github.com/swiftlang/swift-package-manager/issues/9302))
- Windows also imposes a per-binary symbol limit. Large packages with many
  transitive symbols may need some dependencies built as dynamic libraries
  instead of static to avoid hitting it. Concrete precedent: SourceKit-LSP
  builds swift-syntax as a dynamic library on Windows for this reason, via
  `$env:SWIFTSYNTAX_BUILD_DYNAMIC_LIBRARY = 1`.
  ([source](https://github.com/swiftlang/sourcekit-lsp/blob/main/CONTRIBUTING.md#windows))

## Packages mixing C/C++ and Swift targets may need manual linker flags

- On Windows, SwiftPM doesn't differentiate C/C++ targets from Swift targets
  the way it does elsewhere, and uses the Swift driver as the linker driver;
  this can require manually linking the Swift runtime, e.g.
  `-Xlinker "%SDKROOT%\usr\lib\swift\windows\x86_64\swiftCore.lib"`.
  (hypothesis — sourced from `swift-driver`'s own build instructions; confirm
  this generalizes to arbitrary packages with mixed C/C++ and Swift targets,
  rather than being specific to how swift-driver itself is composed, before
  stating it as a general rule)

## C, C++, and Win32 interop have Windows-specific entry points

- The Windows SDK is exposed to Swift through the `WinSDK` clang module,
  covering much of the C-based Win32 API surface.
- C++ interop reaches into the more modern, C++-based parts of the Windows SDK.
  (hypothesis — needs a currency check: the source describing virtual-method
  and copyable-type limitations is a 2023 post; verify against current Swift
  release notes before restating a present-tense limitation)
- COM interfaces can be bridged today via C interop, using
  `SWIFT_SHARED_REFERENCE` on reference-counted COM types to get ARC-style
  memory management for free.
- Locating exported symbols at runtime uses `GetProcAddress()` where POSIX
  code would use `dlsym()` — relevant to packages that do plugin-style dynamic
  loading.

## Toolchain and SDK layout differs from other platforms

- Windows installs the Runtime, SDK, and Toolchain as separate components
  (e.g. under `%ProgramFiles%\Swift\...` and `%ProgramFiles%\Platforms\...`)
  rather than as a single bundled install. Packages with custom build plugins
  or resource-handling logic that assumes a macOS/Linux-style single-tree
  layout may need to account for this.

## Networking gaps to know about

- (hypothesis — forum thread title only, needs a full-thread read) URLSession
  proxy configuration reportedly didn't work on Windows as of Swift 6.0.2;
  verify current status before asserting this as a still-open limitation.

## Not found / explicitly out of scope

- No source reviewed in this pass documents case-sensitivity, path-separator,
  or line-ending guidance aimed at *package authors* (as opposed to the
  compiler's own repository) — don't draft this from general Windows knowledge;
  either source it properly in a follow-up pass or omit it.
- `git config core.symlinks true` / `core.autocrlf false` is documented only
  for building the Swift compiler's own repository and for building
  SourceKit-LSP on Windows — it is not demonstrated as general advice for an
  arbitrary Swift package's repository. Treat as a hypothesis, not a fact, if
  included at all.

# Building for Windows

Build Swift applications and libraries on Windows.

<!--
Draft outline — headings + one-line nuggets, not final prose yet.
Every non-hypothesis bullet is backed by a source opened directly during drafting.
-->

## Overview

- Standard SwiftPM commands (`swift build`, `swift run`, `swift test`) are
  unchanged on Windows — this article covers only what's different, not the
  basics.
- Scope note: this article is about building *your* package or app with an
  already-installed toolchain. It is a different task from building the Swift
  compiler toolchain itself — see
  [Building the Swift toolchain on Windows](https://github.com/swiftlang/swift/blob/main/docs/WindowsBuild.md)
  if that's what you're looking for; that content isn't duplicated here.

## Static linking is not yet fully supported

- Passing `--static-swift-stdlib` currently produces an error under the Swift
  Build system on Windows. See <doc:porting-swift-packages> for why, and for
  the deployment implications of not being able to ship a fully static binary.

## Debugging build output has a known gap

- Swift Build doesn't yet support the CodeView debug information format on
  Windows, which limits debugging capability compared to macOS/Linux.
  ([tracking issue](https://github.com/swiftlang/swift-package-manager/issues/9302))

## If the build can't find your Visual Studio installation

- `swift build` normally locates your Visual Studio/Windows SDK installation
  automatically (via `vswhere`, environment variables, or the registry). When
  that fails, explicit flags are available as a fallback:
  `-visualc-tools-root`, `-visualc-tools-version`, `-windows-sdk-root`,
  `-windows-sdk-version`.

<!--
Open question for the user: after routing the static-linking explanation to
porting-swift-packages.md, this article is short — three real, narrow facts.
Decide whether to keep it as a fourth sibling article, or fold these points
into a closing section of getting-started.md instead.
-->

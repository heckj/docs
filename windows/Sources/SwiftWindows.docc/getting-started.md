# Getting Started

Set up your environment to develop Swift applications on Windows.

<!--
Draft outline — headings + one-line nuggets, not final prose yet.
Every non-hypothesis bullet is backed by a source opened directly during drafting;
bullets marked (hypothesis) rest on a forum thread title only and need a full-thread
read before being stated as fact.
-->

## Overview

- Scope: this article covers the platform-specific prerequisites and setup steps
  you need *beyond* running the installer, to get a working compiler you can use
  from the command line — it isn't a replacement for the install instructions.
  Link out to [Install Swift on Windows](https://www.swift.org/install/windows/)
  for the actual install flow rather than duplicating it.

## Choose your setup path

- Native Windows (MSVC) is the currently supported day-to-day path for building
  and running Swift code on Windows.
- Windows Subsystem for Linux (WSL) is an alternative: it's an Ubuntu environment,
  so Linux instructions apply once inside it.
  (hypothesis — needs a currency check: the source noting WSL1 REPL/LLDB hangs is
  dated November 2019; verify this distinction between WSL1 and WSL2 is still
  accurate before stating it as current)

## Install the platform-specific prerequisites

- Beyond Swift's general dependencies (Git, Python for LLDB), Windows needs the
  Windows SDK and Visual Studio's C++ Build Tools.
- Exact components: MSVC v143 VS 2022 C++ x64/x86 build tools, MSVC v143 VS 2022
  C++ ARM64/ARM64EC build tools, and the Windows 11 SDK (10.0.22000.0 or newer).
- Installing the ARM64 build tools too — even on an x64 machine — is recommended
  so you can cross-compile to different architectures later.
- Link to [Manual installation](https://www.swift.org/install/windows/manual/)
  for the exact Visual Studio component IDs, rather than restate the table here.

## Enable Developer Mode

- Developer Mode is a distinct, easy-to-miss step required for Swift Package
  Manager to work correctly on Windows — it's not enabled by installing Visual
  Studio alone. Link to Microsoft's
  [enable developer mode](https://learn.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development)
  instructions rather than reproduce them.

## Verify your toolchain is operational

- A trivial `swift build` or `swift --version` is the basic smoke test once the
  installer and prerequisites above are in place.
- If the compiler can't automatically locate your Visual Studio installation
  (normally found via `vswhere`/environment/registry lookup), explicit fallback
  flags exist: `-visualc-tools-root`, `-windows-sdk-root`, `-windows-sdk-version`.
  Treat this as an advanced/troubleshooting note, not a first-run expectation.

## Extra setup for the REPL

- The REPL needs Python available on `%PATH%` — check
  [Using the REPL](https://www.swift.org/getting-started/repl/#on-windows) for the
  exact command, since the Python version pinned there may drift from the version
  pinned in the general install dependencies; don't hardcode a specific version
  here.
- Because Windows installs the SDK separately from the toolchain, the REPL
  sometimes needs explicit flags to find both, e.g.
  `-sdk %SDKROOT% -I %SDKROOT%/usr/lib/swift -L %SDKROOT%/usr/lib/swift/windows`.

## Common first-run errors

> Note: Every item below is a **hypothesis** sourced from a forum thread title
> only (not a full thread read) — do not treat these as confirmed root causes or
> promote them to prescriptive fixes until a follow-up pass reads the full
> threads.

- (hypothesis) "`stdint.h` not found" on a fresh install — possibly a missing or
  mismatched Windows SDK component.
- (hypothesis) Module redefinition errors (e.g. `CFURLSessionInterface`) when
  compiling a first `hello.swift`.
- (hypothesis) "unable to load standard library for target
  `x86_64-unknown-windows-msvc`" — possibly an `SDKROOT`/target mismatch.

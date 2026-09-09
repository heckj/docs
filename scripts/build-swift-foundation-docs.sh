#!/bin/sh
##===----------------------------------------------------------------------===##
##
## This source file is part of the Swift.org open source project
##
## Copyright (c) 2026 Apple Inc. and the Swift.org project authors
## Licensed under Apache License v2.0
##
## See LICENSE.txt for license information
## See CONTRIBUTORS.txt for the list of Swift.org project authors
##
## SPDX-License-Identifier: Apache-2.0
##
##===----------------------------------------------------------------------===##
#
# Phase 1 of building swift-foundation's documentation: clone the repo, build
# it, and extract symbol graphs for FoundationEssentials and
# FoundationInternationalization. This is as far as this script goes.
#
# `swift package generate-documentation` crashes on swift-foundation
# (rdar://181833559), so it can't use the plugin path every other package in
# sources.json uses. Instead, build_docs.py's `docc_catalog` +
# `additional_symbol_graph_dir` fields (see sources.json's
# swift-foundation-essentials / swift-foundation-internationalization
# entries) pick up where this script leaves off: they run `docc convert`
# directly against the symbol graphs this script produces, and fold the
# result into the combined archive like any other source.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
WORKSPACE_DIR="$ROOT_DIR/.workspace"
SOURCE_DIR="$WORKSPACE_DIR/swift-foundation"

# TODO: switch to the upstream repo/ref once
# https://github.com/swiftlang/swift-foundation/pull/2209 merges.
GIT_REPO="https://github.com/invalidname/swift-foundation.git"
GIT_REF="invalidname/docs-initial-curation-183033099"

# `swift-symbolgraph-extract` is on PATH directly on Linux, but only
# reachable via `xcrun` on macOS (mirrors build_docs.py's discover_tools()).
# On macOS it also needs an explicit -sdk — unlike `swift build`, it doesn't
# auto-infer one, and fails with "missing required modules: 'Swift', ..." /
# "did you forget to set an SDK" without it. Linux doesn't need neither xcrun or `-sdk`.
#
# The vendored ICU headers also need a platform-specific -I:
# macOS's toolchain has no bundled copy of _FoundationICU, so
# without also pointing -I directly at .../icuSources/include/_foundation_unicode
# (where its module.modulemap actually lives), Clang can't find the module at
# all ("missing required module '_FoundationICU'").
# Linux's toolchain image *does* ship its own copy at
# /usr/lib/swift/_foundation_unicode/, found automatically regardless of our
# -I flags; adding that same extra -I on Linux makes ICU's own vendored
# _foundation_unicode/uchar.h reachable via the bare name `<uchar.h>`.
# This shadows the real system C11 header _foundation_unicode/ptypes.h expects
# for char16_t, producing "unknown type name 'U_CAPI'".
if command -v xcrun >/dev/null 2>&1 && xcrun --find swift-symbolgraph-extract >/dev/null 2>&1; then
    SYMBOLGRAPH_EXTRACT="xcrun swift-symbolgraph-extract"
    SDK_FLAGS="-sdk $(xcrun --sdk macosx --show-sdk-path)"
    ICU_EXTRA_INCLUDE_FLAGS="-I .build/checkouts/swift-foundation-icu/icuSources/include/_foundation_unicode"
else
    SYMBOLGRAPH_EXTRACT="swift-symbolgraph-extract"
    SDK_FLAGS=""
    ICU_EXTRA_INCLUDE_FLAGS=""
fi

mkdir -p "$WORKSPACE_DIR"

if [ -d "$SOURCE_DIR/.git" ]; then
    echo "Updating existing clone (ref: ${GIT_REF})..."
    git -C "$SOURCE_DIR" fetch --quiet origin "$GIT_REF"
    git -C "$SOURCE_DIR" checkout --quiet "$GIT_REF" \
        || git -C "$SOURCE_DIR" checkout --quiet -b "$GIT_REF" "origin/$GIT_REF"
    git -C "$SOURCE_DIR" reset --quiet --hard "origin/$GIT_REF"
    git -C "$SOURCE_DIR" clean --quiet -fdx
else
    echo "Cloning ${GIT_REPO} (ref: ${GIT_REF})..."
    git clone --quiet --branch "$GIT_REF" "$GIT_REPO" "$SOURCE_DIR"
fi

cd "$SOURCE_DIR"

echo "Building swift-foundation..."
# `swift build` is currently known to exit non-zero on Linux nightly
# toolchains, failing at/near the very last build step with a bare
# "error: Build failed" and no underlying compiler diagnostic anywhere in the
# log — every other line is a warning. Despite that, both
# FoundationEssentials and FoundationInternationalization still get their
# .swiftmodule produced successfully, so we don't let this abort the script —
# the symbol-graph extraction steps below are the real verification that the
# two modules we need built correctly.
swift build || echo "swift build reported a non-zero exit; continuing to see whether the modules we need still built."

echo "Setting up .build/symbols directories..."
rm -rf .build/symbols
mkdir -p .build/symbols/FoundationEssentials .build/symbols/FoundationInternationalization

echo "Extracting FoundationEssentials symbol graph..."
$SYMBOLGRAPH_EXTRACT -pretty-print -module-name FoundationEssentials \
    -output-dir .build/symbols/FoundationEssentials \
    -I .build/debug \
    -I Sources/_FoundationCShims/include \
    $SDK_FLAGS \
    -emit-extension-block-symbols

# See the platform-specific ICU_EXTRA_INCLUDE_FLAGS comment above for why
# that flag is conditional rather than always present or always absent.
echo "Extracting FoundationInternationalization symbol graph..."
$SYMBOLGRAPH_EXTRACT -pretty-print -module-name FoundationInternationalization \
    -output-dir .build/symbols/FoundationInternationalization \
    -I .build/debug \
    -I Sources/_FoundationCShims/include \
    -I .build/checkouts/swift-foundation-icu/icuSources/include \
    $ICU_EXTRA_INCLUDE_FLAGS \
    $SDK_FLAGS \
    -emit-extension-block-symbols

echo "Done. Symbol graphs ready under ${SOURCE_DIR}/.build/symbols/"

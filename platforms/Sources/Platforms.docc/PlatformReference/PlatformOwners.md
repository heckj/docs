# Finding Platform Owners and Governance

Learn who maintains Swift on each platform
and how platform support decisions are made.

## Overview

Each Swift platform has a designated platform owner
who acts as the primary steward of that platform's support.
Platform owners coordinate contributors,
guide platform-specific changes,
and monitor continuous integration for their platforms.

### Current platform owners

| Platform | Owner | PR testing required |
|---|---|---|
| Apple platforms (macOS, iOS, watchOS, tvOS) | [Apple Inc.](https://www.apple.com) | Yes |
| Linux (Ubuntu, Debian, Fedora, Amazon Linux, Red Hat UBI) | [Apple Inc.](https://www.apple.com) | Yes |
| Windows | [Apple Inc.](https://www.apple.com) | Yes |

### Platform Steering Group

The Platform Steering Group oversees
the platform tier system
and evaluates proposals for new platforms.
You can reach the group at
[@platform-steering-group](https://forums.swift.org)
on the Swift Forums.

Platform owners have dedicated sections on the
[Swift Forums](https://forums.swift.org)
and meet regularly to discuss
active development and open issues on their platforms.

### Continuous integration

Continuous integration is a critical part
of maintaining platform support.
Pull requests for Tier 1 platforms require
builds and tests to pass before merging.

Platform owners are responsible for:

- Monitoring CI for the main and release branches
- Providing or securing the hardware
  for continuous testing
- Working with contributors to resolve
  platform-specific test failures

### Code signing

Platform owners build and sign the toolchain
before providing it for distribution.
Apple re-signs toolchains under the
[swift.org](https://www.swift.org) certificate
for distribution on the website.
Random audits validate signatures
between platform owners and Apple.

### Escalate platform issues

If you encounter a platform-specific issue:

1. File a GitHub issue in the relevant
   [swiftlang repository](https://github.com/swiftlang).
2. Post about the issue on the
   [Swift Forums](https://forums.swift.org),
   tagging the platform owner.
3. If the issue is not addressed,
   raise it with the Platform Steering Group
   at `@platform-steering-group` on the forums.

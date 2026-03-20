# Understanding Platform Support Tiers

Learn how Swift classifies platform support into tiers
and what each tier means for you as a developer.

## Overview

Swift uses a three-tier system, defined by
[SP-0001: Platform Support Tiers](https://github.com/swiftlang/swift-evolution/blob/main/policies/0001-platform-support-tiers.md), to communicate
the level of support you can expect on each platform.
The tiers reflect the maturity of Swift on a given platform,
the testing and quality guarantees the project provides,
and who is responsible for maintaining that support.

### Tier 1 --- Supported

Tier 1 platforms have the strongest guarantees.
When you use Swift on a Tier 1 platform, you can expect:

- Official toolchain builds are available from swift.org,
  digitally signed with a Software Bill of Materials.
- Automated testing runs on every pull request,
  and test failures block merging.
- The Swift community shares collective responsibility
  for keeping these platforms working.
- Breaking changes that affect a Tier 1 platform
  require resolution with the platform owner.
- Support spans three versions:
  the current stable release,
  the next planned release,
  and the main development branch.

#### Tier 1 toolchain hosts

Some Tier 1 platforms serve as toolchain hosts.
In addition to running Swift programs,
these platforms run the full set of development tools ---
the compiler, a C/C++ toolchain, the debugger,
and the Swift Package Manager.
Official toolchain distributions are available for download
from swift.org.

### Tier 2 --- Experimental

Tier 2 platforms build successfully
and pass most of their test suites,
but they may have occasional test failures.
When you use Swift on a Tier 2 platform, you can expect:

- The platform builds and generally works,
  but it does not receive the same level of testing as Tier 1.
- The platform owner, rather than the broader community,
  is primarily responsible for maintaining support.
- Support spans two versions:
  the current stable release and the main development branch.

### Tier 3 --- Exploratory

Tier 3 platforms are at an early stage of development.
When you use Swift on a Tier 3 platform, you can expect:

- The platform can produce a reproducible build
  on the main development branch.
- Builds may not always succeed,
  and there is no guarantee of completeness or consistency.
- The platform owner maintains the buildable state.

### Platform identification

Each Swift platform is identified by an LLVM target triple ---
a string like `x86_64-unknown-linux-gnu`
that specifies the architecture, vendor, operating system,
and environment.
For a complete list of supported triples,
see <doc:PlatformReference>.

### Propose a new platform

Community members can propose adding new platforms
by submitting a formal request to the Platform Steering Group.
The request must include the platform name,
the proposed tier level,
the platform owner and their contact information,
build instructions,
an explanation of any unmet tier requirements,
and the status of CI provisioning.

The Platform Steering Group evaluates proposals
based on the overall benefit to the Swift project.
Meeting every listed requirement is not strictly necessary ---
the group considers the full picture
when deciding whether to accept a platform.

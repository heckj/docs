# Contributing to *Swift Documentation*

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

## Submitting a pull request

Swift Documentation content follows [Apple Style Guide][asg] and [the terms and rules from the TSPL style guide][tspl-style].

By submitting a pull request, you represent that you have the right to license your contribution to the community, and agree by submitting the patch that your contributions are licensed under the Apache 2.0 license (see [LICENSE][license]).

### Small changes

For small changes, like typo fixes and revisions within a few paragraphs,
the discussion of those changes is usually small enough to be part of the pull request.

### Larger changes

For large changes, such as new articles, guides, or larger sets of content, please start a thread in the [Swift forums][forum] to discuss what you are proposing to add.
Depending on the size and scope, the project may ask for an outline and/or the intended scope prior to accepting any pull requests for content itself.
The work on larger sets of content may also be tracked with [issues][issues] on this repository in order to coordinate collaboration.

[asg]: https://help.apple.com/applestyleguide/
[issues]: https://github.com/swiftlang/docs/issues
[forum]: https://forums.swift.org/
[tspl-style]: https://github.com/swiftlang/swift-book/blob/main/Style.md#terms-and-rules
[license]: /LICENSE.txt

### Checking and previewing content changes

Build, check, and preview the documentation using the swift-docc-plugin tooling included with each of the packages.

To check the documentation:

```bash
swift package generate-documentation --analyze --warnings-as-errors
```

To preview a documentation catalog:

```bash
swift package --disable-sandbox preview-documentation
```

### How to submit your pull request

Use the following steps when creating a new pull request:

1. Test that your changes don't have any warnings:

```bash
swift package generate-documentation --analyze --warnings-as-errors
```

2. Create a pull request in this repository.
3. Write a brief message in the pull request to introduce your work in context.

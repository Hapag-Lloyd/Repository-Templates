# Repository-Templates

This repository stores templates used to setup new repositories. The templates are stored in `templates/`.

## Default Templates

Stored in `templates/default` and added to every new project. Contains a set of linters, release management, ChatOps
tools and a welcome message for contributors as well as a contribution guideline.

To ensure a high quality of committed files, a [pre-commit](https://pre-commit.com/) configuration is also provided and
can be installed with `pre-commit install`. The default configuration detects the most common errors in the code and
runs very fast.

Release management is done with [release-please](https://github.com/googleapis/release-please). All PRs are merged into
main and the release tool automatically created a new PR with a changelog. As soon as this PR is merged, the release
is tagged and published on GitHub.

For updating the dependencies automatically we provide a [Renovate](https://docs.renovatebot.com/) configuration file.
Renovate automatically proposes a PR if a dependency is out of date.

## Terraform Module Templates

The templates are stored in `templates/terraform-module`.

A Terraform module should at least provide 3 examples
1. `examples/cost`: for infrastructure cost calculation
2. `examples/simple`: for a quick and easy demonstration
3. `examples/full`: for a full blown example

So far it runs a `terraform validate` for all examples and the Terraform minimum version (insert in the workflow file!)
and the latest Terraform version.

Planned:
  - integrate TfLint
  - integrate Infracost
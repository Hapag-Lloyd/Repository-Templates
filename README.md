# Repository-Templates

This repository stores templates used to setup new repositories. The templates are stored in `templates/`.

## Workflows

This repository holds a set of GitHub workflows for the most common use cases. The workflows are stored in `.github/workflows/`.
The prefix `default_` indicates workflows that shall be added to every nre repository. The prefix `terraform_module` indicates
workflows that are useful for Terraform modules.

Using these workflows in your repository is quite simple:

```yaml
---
name: Lint files

# Attention
#
# 1. for the "on" clause check the workflow definition called and copy the commented lines from there
# 2. use the current commit hash of the Hapag-Lloyd/Repository-Templates repository. The hash is automatically updated by
#    Renovate.
#

# yamllint disable-line rule:truthy
on:
  pull_request:

jobs:
  default:
    uses: Hapag-Lloyd/Repository-Templates/.github/workflows/default_linter_callable.yml@83145674c405973a9d1797a6b39887670938315b
    secrets: inherit
```

Workflow files starting with `this_*` can be ignored. They are used for this repository only.

## Default Templates

Stored in `templates/default` and added to every new project. Contains basic configuration of all tools, like linters,
release management, ChatOps, stale issue and PR management and a welcome message for contributors as well as a contribution
guideline.

To ensure a high quality of committed files, a [pre-commit](https://pre-commit.com/) configuration is also provided and
can be installed with `pre-commit install`. The default configuration detects the most common errors in the code and
runs very fast.

Release management is done with [semantic-release](https://github.com/semantic-release/semantic-release). Releases are automatically
tagged and published on GitHub. Plugins for Maven, Npm, ... are available.

For updating the dependencies automatically we provide a [Renovate](https://docs.renovatebot.com/) configuration file.
Renovate automatically proposes a PR if a dependency is out of date.

## Terraform Module Templates

The templates are stored in `templates/terraform-module`.

A Terraform module should at least provide 3 examples

1. `examples/cost`: for infrastructure cost calculation
2. `examples/simple`: for a quick and easy demonstration
3. `examples/full`: for a full blown example

It runs a `terraform validate` for all examples and the Terraform minimum version (insert in the workflow file!)
and the latest Terraform version.

In addition `tflint` is also executed.

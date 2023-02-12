#!/usr/bin/env bash
set -euo pipefail

#
# Creates a PR in the repository updating all default files present in the global templates repository.
#
# update_workflows.sh repository_to_update
#
# repository_to_update: e.g. Hapag-Lloyd/terraform-aws-bastion-host-ssm
#

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --*|-*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

repo_to_update=$1

temp_dir=$(mktemp -d)

cd "$temp_dir"

gh repo clone Hapag-Lloyd/Repository-Templates templates
gh repo clone "$repo_to_update" update

cd update

git checkout -b update-workflows

cp -dpr ../templates/templates/default/* .
cp -dpr ../templates/templates/default/.github .
cp -dpr ../templates/templates/default/.config .

git add .
git commit -m "update workflows"
git push --set-upstream origin update-workflows

gh pr create -f -t "chore: update workflows"

gh pr view

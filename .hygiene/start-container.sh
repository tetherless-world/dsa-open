#!/bin/bash

repo_dir=${repo_dir:-"$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." >/dev/null 2>&1 && pwd )"}

export ONTPUB_FAMILY="${repo_dir##*/}"
export WORKSPACE="$(cd "${repo_dir}" && cd .. && pwd)"

cd "$repo_dir/.hygiene/docker/compose/hygiene"
docker-compose pull hygiene

# Run the hygiene script in detached mode
docker-compose up -d hygiene
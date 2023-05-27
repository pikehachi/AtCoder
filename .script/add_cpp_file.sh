#!/bin/bash

workspace_dir=$1

echo -n 'Path:'
read -r path
echo -n 'Problem count:'
read -r count

contest_dir=${workspace_dir}/${path}
mkdir -p "$contest_dir"
cd "$contest_dir" || exit 1

problems=({a..z})
for problem in "${problems[@]:0:$count}"; do
    touch "${problem}.cpp"
done

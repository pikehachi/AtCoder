#!/bin/bash

relative_file=$1
relative_path=$(dirname "$relative_file")
problem_id=$(basename "$relative_file" .cpp)

download_dir=${relative_path}/build/testcase/${problem_id}
mkdir -p -- "$download_dir"

current_max_number=$(
    find "${download_dir}" -regex "^${download_dir}/user-[1-9][0-9]*\.in\$" |
        sed "s|^${download_dir}/user-||" |
        sed "s/.in\$//" |
        sort -n -r |
        head -n 1
)
current_max_number=${current_max_number:-0}

code -- "${download_dir}/user-$((current_max_number + 1)).out"
code -- "${download_dir}/user-$((current_max_number + 1)).in"

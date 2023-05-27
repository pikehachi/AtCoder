#!/bin/bash

relative_file=$1
relative_path=$(dirname "$relative_file")
contest_name=${relative_path//\//}
problem_id=$(basename "$relative_file" .cpp)
url=https://atcoder.jp/contests/${contest_name}/tasks/${contest_name}_${problem_id}

download_dir=${relative_path}/build/testcase/${problem_id}
mkdir -p "$download_dir"

if [[ ! -e ${download_dir}/sample-1.in ]]; then
    if ! oj dl -d "$download_dir" "$url"; then
        oj login https://atcoder.jp/ || exit 1
        oj dl -d "$download_dir" "$url" || exit 2
    fi
    clear
fi

oj t -e 1e-6 -c "${relative_path}/build/${problem_id}" -d "${relative_path}/build/testcase/${problem_id}" -j 4

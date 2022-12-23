#!/bin/bash
set -e

FROM=${1:-000}    
FILES=`ls | sort -n -t - -k 1`

for f in $FILES
do
  if [[ "$f" == *".yaml" ]]; then
    echo "Processing $f file..."
    # take action on each file. $f store current file name
    ORDER=$(echo $f | cut -d'-' -f 1)
    echo checking $ORDER
    if (( ${ORDER#0} >= $FROM )); then
        docker run --platform linux/aarch64 --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/$f --arch aarch64 --keyring-append local-melange.rsa.pub --signing-key local-melange.rsa --keyring-append https://packages.wolfi.dev/os/wolfi-signing.rsa.pub --repository-append https://packages.wolfi.dev/os --repository-append /work/packages --source-dir foo
    fi
  fi

done

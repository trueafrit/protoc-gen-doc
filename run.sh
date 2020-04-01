#!/bin/bash

FILES="$@"

if [ -z "${FILES}" ]; then
  echo "Empty params, chose all proto."
  FILES=`find . -type f -name '*.proto'`
fi

echo "Generate for ${FILES}"
DIRS=`find . -type d | grep -v ".git" | xargs -i echo -I'{}'`
protoc ${DIRS} --doc_out=/out ${FILES}

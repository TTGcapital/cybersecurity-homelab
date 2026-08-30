#!/bin/bash

set -o pipefail

THRESHOLD=${1:-3}

if ! [[ "$THRESHOLD" =~ ^[1-9][0-9]*$ ]]; then
  echo "Usage: $0 [positive-integer-threshold]" >&2
  exit 2
fi

journalctl -u ssh --since "24 hours ago" --no-pager |
grep "Failed password" |
sed -E 's/.*Failed password for (invalid user )?([^ ]+) from ([^ ]+).*/user=\2 source=\3/' |
sort |
uniq -c |
awk -v threshold="$THRESHOLD" '{
  level = ($1 >= threshold) ? "ALERT" : "INFO"
  print "[" level "] attempts=" $1, $2, $3
}'

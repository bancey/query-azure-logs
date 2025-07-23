#!/bin/bash

SNI_VALUE="$1"

if [ -z "$SNI_VALUE" ]; then
  echo "Usage: $0 <sni_value>"
  exit 1
fi

jq -c "select(.properties.sni == \"$SNI_VALUE\")" data/combined.jsonl > data/combined_filtered.jsonl

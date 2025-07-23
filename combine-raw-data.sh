find rawdata -type f -name "*.json" -print0 | xargs -0 cat > data/combined.jsonl

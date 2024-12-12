# check packages.json
check:
    uv run --python 3.13 -m json.tool packages.json > /dev/null

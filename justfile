# check packages.json
check:
    uv run --python 3.14 -m json.tool packages.json > /dev/null

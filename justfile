# check packages.json
check:
    uv run --python 3.14 -m json.tool packages.json > /dev/null && echo "JSON check passed"

# add a package entry to packages.json in alphabetical order
add pkgname url branch="" subdir="":
    #!/usr/bin/env -S uv run --python 3.14 python3
    import json
    pkgname = "{{pkgname}}"
    url = "{{url}}"
    branch = "{{branch}}"
    subdir = "{{subdir}}"
    with open("packages.json") as f:
        packages = json.load(f)
    entry = {"package": pkgname, "url": url}
    if branch:
        entry["branch"] = branch
    if subdir:
        entry["subdir"] = subdir
    packages.append(entry)
    packages.sort(key=lambda p: p["package"].lower())
    with open("packages.json", "w") as f:
        json.dump(packages, f, indent=2)
        f.write("\n")
    print(f"Added {pkgname}")

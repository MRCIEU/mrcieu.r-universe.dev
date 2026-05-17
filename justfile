# check packages.json
check:
    uv run --python 3.14 -m json.tool packages.json > /dev/null && echo "JSON check passed"

# add a package entry to packages.json in alphabetical order
[arg("branch", short="b")]
[arg("pkgname", short="p")]
[arg("subdir", short="s")]
add url pkgname="" branch="" subdir="":
    #!/usr/bin/env -S uv run --python 3.14 python3
    import json, re, sys
    url = "{{ url }}"
    if re.fullmatch(r'[^/]+/[^/]+', url):
        url = f"https://github.com/{url}"
    pkgname = "{{ pkgname }}" or url.rstrip("/").split("/")[-1]
    branch = "{{ branch }}"
    subdir = "{{ subdir }}"
    with open("packages.json") as f:
        packages = json.load(f)
    if any(p["package"] == pkgname for p in packages):
        print(f"Error: '{pkgname}' already exists in packages.json", file=sys.stderr)
        sys.exit(1)
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

# remove a package entry from packages.json
remove pkgname:
    #!/usr/bin/env -S uv run --python 3.14 python3
    import json, sys
    pkgname = "{{ pkgname }}"
    with open("packages.json") as f:
        packages = json.load(f)
    filtered = [p for p in packages if p["package"] != pkgname]
    if len(filtered) == len(packages):
        print(f"Error: '{pkgname}' not found in packages.json", file=sys.stderr)
        sys.exit(1)
    with open("packages.json", "w") as f:
        json.dump(filtered, f, indent=2)
        f.write("\n")
    print(f"Removed {pkgname}")

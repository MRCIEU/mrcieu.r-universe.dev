# mrcieu.r-universe.dev :rocket:
[![:name status badge](https://mrcieu.r-universe.dev/badges/:name)](https://mrcieu.r-universe.dev/)
[![:registry status badge](https://mrcieu.r-universe.dev/badges/:registry)](https://github.com/r-universe/mrcieu/actions/workflows/sync.yml)
[![:total status badge](https://mrcieu.r-universe.dev/badges/:total)](https://mrcieu.r-universe.dev/)

This is the repo specifying which R packages contribute to <https://mrcieu.r-universe.dev/>.

To add/remove packages please edit the *packages.json* file in this repository (<https://github.com/MRCIEU/mrcieu.r-universe.dev>). Each package requires at least 2 attributes; `"package"` and `"url"`. The `"url"` must be a Git repo (it doesn't have to be on GitHub, i.e., it could be on GitLab or other online Git server. And the package doesn't even have to be a package under the MRCIEU GitHub account). There is a third optional attribute `"branch"` which can be specified if required, e.g., to obtain a release branch. As an example, the entry for TwoSampleMR is simply
```json
    {
        "package": "TwoSampleMR",
        "url": "https://github.com/MRCIEU/TwoSampleMR"
    }
```

(The corresponding source universe repo, which is managed by r-universe, is at <https://github.com/r-universe/mrcieu>.)

The instructions about how to setup on r-universe.dev are [here](https://ropensci.org/blog/2021/06/22/setup-runiverse/).

# mrcieu.r-universe.dev :rocket:

[![:name status badge](https://mrcieu.r-universe.dev/badges/:name)](https://mrcieu.r-universe.dev/)
[![:registry status badge](https://mrcieu.r-universe.dev/badges/:registry)](https://github.com/r-universe/mrcieu/actions/workflows/sync.yml)
[![:total status badge](https://mrcieu.r-universe.dev/badges/:total)](https://mrcieu.r-universe.dev/)

This is the registry repo specifying which R packages contribute to <https://mrcieu.r-universe.dev/>.

The corresponding source universe repo, which is managed by r-universe, is at <https://github.com/r-universe/mrcieu>.

The corresponding orgmetrics dashboard is published at the GitHub Pages address for this repo <https://mrcieu.github.io/mrcieu.r-universe.dev/>

## How to install binary R packages from the MRCIEU R-universe

To install binary R packages from the MRCIEU R-universe, include the relevant URL in your `repos` list as shown below (alternatively you can set the `repos` option using `options(repos = c(...))` which you could do in your *.Rprofile* file).

### Windows and Macs

For Windows and Mac users (for both Intel Macs and Apple Silicon Macs [aka M series]) the installation code to obtain a binary version of **TwoSampleMR** is

```r
# Installation code for Windows and Mac users
install.packages(
  'TwoSampleMR',
  repos = c(
    'https://mrcieu.r-universe.dev',
    'https://cloud.r-project.org'
  )
)
```

On Windows, binary packages are available for the release, development, and previous versions of R.

On macOS, binary packages are available for the release and previous versions of R.

### Ubuntu Linux Noble Numbat

Copying from the [official documentation about Linux binary packages](https://docs.r-universe.dev/install/binaries.html#binaries-linux)

```r
linux_binary_repo <- function(universe){
  sprintf('https://%s.r-universe.dev/bin/linux/noble-%s/%s/', 
    universe,
    R.version$arch, 
    substr(getRversion(), 1, 3))
}

# For example: enable ropensci and cran repositories 
options(repos = linux_binary_repo(c('ropensci', 'cran')))

# Then install say TwoSampleMR with
install.packages("TwoSampleMR")
```

If you prefer to obtain your CRAN binary packages from the Public Posit Package Manager see the setup page on the website. You will need a repos entry along the lines of

```r
arch <- R.version["arch"]
rv <- substr(getRversion(), 1, 3)
options(repos = c(
  CRAN = sprintf("https://packagemanager.posit.co/cran/latest/bin/linux/noble-%s/%s", arch, rv),
  runiverse = sprintf("https://mrcieu.r-universe.dev/bin/linux/noble-%s/%s/", arch, rv)
))

# Then install say TwoSampleMR with
install.packages("TwoSampleMR")
```

As `ubuntu:latest` changes you would need to change the codename `noble` within this. For example, r-universe will likely swap to Resolute Raccoon (`resolute`) soon.

### WebR

WASM binaries for [WebR](https://docs.r-wasm.org/webr/latest/) users are available with the code below. Note that currently not all packages are available for WebR.

```r
install.packages('TwoSampleMR',
  repos = c('https://mrcieu.r-universe.dev', 'https://repo.r-wasm.org'))
```

## Notes for developers adding/removing packages to the r-universe

To add/remove packages please edit the *packages.json* file in this repository (<https://github.com/MRCIEU/mrcieu.r-universe.dev>). Each package requires at least 2 attributes; `"package"` and `"url"`. The `"url"` must be a Git repo (it doesn't have to be on GitHub, i.e., it could be on GitLab or other online Git server. And the package doesn't even have to be a package under the MRCIEU GitHub account). There is an optional attribute `"branch"` which can be specified if required, e.g., obtain the latest GitHub release by specifying `"branch": "*release"`. And there is an optional attribute `"subdir"` if the R package source code is in a subdirectory in the repository. As an example, the entry for the **TwoSampleMR** package is simply

```json
    {
        "package": "TwoSampleMR",
        "url": "https://github.com/MRCIEU/TwoSampleMR"
    }
```

The instructions about how to setup on r-universe.dev are [here](https://ropensci.org/blog/2021/06/22/setup-runiverse/) and [here](https://github.com/r-universe-org/help#readme).

To check _packages.json_ is correctly formatted you can run the following locally (you will need [`uv`](https://docs.astral.sh/uv/getting-started/installation/) installed). There is also a GitHub actions workflow which runs.

```sh
just check
```

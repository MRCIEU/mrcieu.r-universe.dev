# mrcieu.r-universe.dev :rocket:

[![:name status badge](https://mrcieu.r-universe.dev/badges/:name)](https://mrcieu.r-universe.dev/)
[![:registry status badge](https://mrcieu.r-universe.dev/badges/:registry)](https://github.com/r-universe/mrcieu/actions/workflows/sync.yml)
[![:total status badge](https://mrcieu.r-universe.dev/badges/:total)](https://mrcieu.r-universe.dev/)

This is the registry repo specifying which R packages contribute to <https://mrcieu.r-universe.dev/>.

The corresponding source universe repo, which is managed by r-universe, is at <https://github.com/r-universe/mrcieu>.

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

### Ubuntu Linux Noble Numbat using R-release (version 4.5.#)

#### Ubuntu Noble Numbat x86_64 using R through RStudio Desktop or RStudio Server

For Ubuntu Noble Numbat users running R through RStudio Desktop or RStudio Server the installation code is

```r
# Installation code for Ubuntu Noble Numbat users in RStudio Desktop or Server
install.packages(
  'TwoSampleMR',
  repos = c(
    'https://mrcieu.r-universe.dev/bin/linux/noble-x86_64/4.5/',
    'https://p3m.dev/cran/__linux__/noble/latest',
    'https://cloud.r-project.org'
  )
)
```

#### Ubuntu Noble Numbat x86_64 using R in a shell

For Ubuntu Noble Numbat users running R in a shell first amend the `HTTPUserAgent` option, as described in the following blog [post](https://tshafer.com/blog/2023/07/posit-package-manager-linux), and then run the Linux installation code above. This is in order to obtain binary packages from the Posit Public Package Manager. If the `HTTPUserAgent` option is not amended it seems that source rather than binary packages are obtained for the Imports dependency packages. So for this case the full installation code is

```r
# Installation code for Ubuntu Noble Numbat users running R in the Terminal
options(HTTPUserAgent = sprintf(
  "R/%s R (%s)",
  getRversion(),
  paste(getRversion(),
        R.version["platform"],
        R.version["arch"],
        R.version["os"])
))

install.packages(
  'TwoSampleMR',
  repos = c(
    'https://mrcieu.r-universe.dev/bin/linux/noble-x86_64/4.5/',
    'https://p3m.dev/cran/__linux__/noble/latest',
    'https://cloud.r-project.org'
  )
)
```

#### Ubuntu Noble Numbat ARM

For Ubuntu Linux on ARM users please use

```r
# Installation code for Ubuntu Noble Numbat users in RStudio Desktop or Server
install.packages(
  'TwoSampleMR',
  repos = c(
    'https://mrcieu.r-universe.dev/bin/linux/noble-aarch64/4.5/',
    'https://cloud.r-project.org'
  )
)
```

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

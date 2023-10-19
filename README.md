# mrcieu.r-universe.dev :rocket:

[![:name status badge](https://mrcieu.r-universe.dev/badges/:name)](https://mrcieu.r-universe.dev/)
[![:registry status badge](https://mrcieu.r-universe.dev/badges/:registry)](https://github.com/r-universe/mrcieu/actions/workflows/sync.yml)
[![:total status badge](https://mrcieu.r-universe.dev/badges/:total)](https://mrcieu.r-universe.dev/)

This is the repo specifying which R packages contribute to <https://mrcieu.r-universe.dev/>.

To add/remove packages please edit the *packages.json* file in this repository (<https://github.com/MRCIEU/mrcieu.r-universe.dev>). Each package requires at least 2 attributes; `"package"` and `"url"`. The `"url"` must be a Git repo (it doesn't have to be on GitHub, i.e., it could be on GitLab or other online Git server. And the package doesn't even have to be a package under the MRCIEU GitHub account). There is a third optional attribute `"branch"` which can be specified if required, e.g., obtain the latest GitHub release by specifying `"branch": "*release"`. As an example, the entry for the **TwoSampleMR** package is simply

```json
    {
        "package": "TwoSampleMR",
        "url": "https://github.com/MRCIEU/TwoSampleMR"
    }
```

(The corresponding source universe repo, which is managed by r-universe, is at <https://github.com/r-universe/mrcieu>.)

The instructions about how to setup on r-universe.dev are [here](https://ropensci.org/blog/2021/06/22/setup-runiverse/) and [here](https://github.com/r-universe-org/help#readme).

## How to install binary R packages from the MRCIEU R-universe

To install binary R packages from the MRCIEU R-universe, include the relevant URL in your `repos` list as shown below (or set the `repos` option using `options(repos = c(...)))`.

For Windows and Intel Mac users the installation code to obtain a binary version of **TwoSampleMR** is

```r
# Installation code for Windows and Intel Mac users
install.packages(
  'TwoSampleMR',
  repos = c(
    'https://mrcieu.r-universe.dev',
    'https://cloud.r-project.org'
  )
)
```

For Ubuntu Jammy Jellyfish users running R through RStudio Desktop or RStudio Server the installation code is

```r
# Installation code for Ubuntu Jammy Jellyfish users in RStudio Desktop or Server
install.packages(
  'TwoSampleMR',
  repos = c(
    'https://mrcieu.r-universe.dev/bin/linux/jammy/4.3/',
    'https://packagemanager.posit.co/cran/__linux__/jammy/latest',
    'https://cloud.r-project.org'
  )
)
```

For Ubuntu Jammy Jellyfish users running R in the Terminal first amend the `HTTPUserAgent` option, as described in the following blog [post](https://tshafer.com/blog/2023/07/posit-package-manager-linux), and then run the Linux installation code above. This is in order to obtain binary packages from the Public Posit Package Manager. If the `HTTPUserAgent` option is not amended it seems that source rather than binary packages are obtained for the Imports dependency packages. So for this case the full installation code is

```r
# Installation code for Ubuntu Jammy Jellyfish users running R in the Terminal
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
    'https://mrcieu.r-universe.dev/bin/linux/jammy/4.3/',
    'https://packagemanager.posit.co/cran/__linux__/jammy/latest',
    'https://cloud.r-project.org'
  )
)
```

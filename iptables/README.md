# Distroless iptables container

This folder contains build logic for building a static distroless image with iptables and libc installed.

Currently, this builds only the `nonroot`, `debian12` variants. However, all architectures are built.

## Build + Publish

```shell
export HUB=gcr.io/istio-release
# Build and publish the docker images
bazel run '//iptables:publish'
```

## Updating

* `git merge main`. Resolve conflicts, usually keeping theirs.
* Run `debian_package_manager/cmd/update`. It will usually do nothing; patch it to always run.
* Run Build + Publish steps with `HUB=localhost:5000` and test it worked as expected locally.
  * `trivy image localhost:5000/iptables`
* Run Build + Publish steps with `HUB=gcr.io/istio-release`
 
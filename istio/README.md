# Istio distroless containers

This folder contains build logic for building a base distroless images for Istio

## Static image

Image based on [static distroless image](https://github.com/istio/distroless/tree/master/base) with `istio-proxy` user and group configured (`id=1337`)

## Libc image

Image based on [static](Static image) with glibc installed.

This is somewhere between `static` and `base` - eliding `openssl`.

## Build + Publish

Currently this builds only the `nonroot`, `debian11` variants. However, all architectures are built.

```shell
export HUB=gcr.io/istio-release/distroless
# Build and publish the docker images
bazel build //package_manager:dpkg_parser.par
bazel run '//istio:publish' --define HUB=${HUB}
# Create a fat manifest with all architectures and publish
./istio/build_docker.sh
```
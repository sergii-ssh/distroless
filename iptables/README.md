# Distroless iptables container

This folder contains build logic for building a base distroless image with iptables installed.

Currently this builds only the `nonroot`, `debian9` variants. However, all architectures are built.

## Build + Publish

```shell
export HUB=gcr.io/istio-release
# Build and publish the docker images
bazel run '//iptables:publish' --define HUB=${HUB}
# Create a fat manifest with all architectures and publish
./istiobuild_docker.sh
```

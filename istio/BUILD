package(default_visibility = ["//visibility:public"])

load("//base:distro.bzl", "DISTRO_PACKAGES", "DISTRO_SUFFIXES")
load("@io_bazel_rules_docker//container:container.bzl", "container_bundle", "container_image")
load("//:checksums.bzl", "ARCHITECTURES")
load("//base:base.bzl", "NONROOT")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//contrib:group.bzl", "group_entry", "group_file")
load("@io_bazel_rules_docker//contrib:passwd.bzl", "passwd_entry", "passwd_tar")

ISTIO_WORKDIR = "/"
ISTIO_PROXY = "istio-proxy"
ISTIO_PROXY_UID = 1337

# Create a passwd file with a nonroot and istio-proxy users and uids.
passwd_entry(
    name = "nonroot_user",
    gid = NONROOT,
    home = "/home/nonroot",
    info = "nonroot",
    shell = "/sbin/nologin",
    uid = NONROOT,
    username = "nonroot",
)

passwd_entry(
    name = "istio_proxy_user",
    gid = ISTIO_PROXY_UID,
    home = "/nonexistent",
    info = "istio-proxy",
    shell = "/sbin/nologin",
    uid = ISTIO_PROXY_UID,
    username = ISTIO_PROXY,
)

passwd_tar(
    name = "passwd_tar",
    entries = [
        ":nonroot_user",
        ":istio_proxy_user",
    ],
    passwd_file_pkg_dir = "etc",
)

group_entry(
    name = "nonroot_group",
    gid = NONROOT,
    groupname = "nonroot",
)

group_entry(
    name = "istio_proxy_group",
    gid = ISTIO_PROXY_UID,
    groupname = ISTIO_PROXY,
)

group_file(
    name = "group",
    entries = [
        ":istio_proxy_group",
        ":nonroot_group",
    ],
)

pkg_tar(
    name = "group_tar",
    srcs = [":group"],
    mode = "0644",
    package_dir = "etc",
)

[
    container_image(
        name = "istio_static" + "_" + arch,
        architecture = arch,
        base = "//base:static" + "_" + "nonroot" + "_" + arch + "_debian11",
        workdir = ISTIO_WORKDIR,
        tars = [
            ":passwd_tar",
            ":group_tar",
        ],
        user = ISTIO_PROXY,
    )
    for arch in ARCHITECTURES
]

[
    container_image(
        name = "istio_libc" + "_" + arch,
        architecture = arch,
        base = "//istio:istio_static" + "_" + arch,
        debs = [
            DISTRO_PACKAGES[arch]["_debian11"]["libc6"],
        ],
    )
    for arch in ARCHITECTURES
]

container_bundle(
    name = "istio_all",
    images = {
        "$(HUB)/distroless-" + lib + ":latest-" + arch: "//istio:istio_" + lib + "_" + arch
        for lib in ["static", "libc"]
        for arch in ARCHITECTURES
    },
)

container_bundle(
    name = "istio_static",
    images = {
        "$(HUB)/distroless-static:latest-" + arch: "//istio:istio_libc_" + arch
        for arch in ARCHITECTURES
    },
)

container_bundle(
    name = "istio_libc",
    images = {
        "$(HUB)/distroless-libc:latest-" + arch: "//istio:istio_static_" + arch
        for arch in ARCHITECTURES
    },
)

load("@io_bazel_rules_docker//contrib:push-all.bzl", "container_push")

container_push(
    name = "publish",
    bundle = ":istio_all",
    format = "Docker",
    # Push images sequentially, to avoid a bug in rules_docker related to
    # pushing many images in parallel.
    # https://github.com/bazelbuild/rules_docker/issues/525
    sequential = True,
)

container_push(
    name = "publish_libc",
    bundle = ":istio_libc",
    format = "Docker",
    # Push images sequentially, to avoid a bug in rules_docker related to
    # pushing many images in parallel.
    # https://github.com/bazelbuild/rules_docker/issues/525
    sequential = True,
)

container_push(
    name = "publish_static",
    bundle = ":istio_static",
    format = "Docker",
    # Push images sequentially, to avoid a bug in rules_docker related to
    # pushing many images in parallel.
    # https://github.com/bazelbuild/rules_docker/issues/525
    sequential = True,
)
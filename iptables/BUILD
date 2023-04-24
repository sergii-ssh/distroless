package(default_visibility = ["//visibility:public"])
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//base:base.bzl", "deb_pkg")
load("@contrib_rules_oci//oci:defs.bzl", "oci_image", "oci_image_index", "oci_push")
load("@io_bazel_rules_docker//container:container.bzl", "container_image", "container_bundle")
load("//:checksums.bzl", "ARCHITECTURES")

pkg_tar(
      name = "symlinks",
      symlinks = {
        "/usr/sbin/iptables": "/usr/sbin/iptables-legacy",
        "/usr/sbin/iptables-restore": "/usr/sbin/iptables-legacy-restore",
        "/usr/sbin/iptables-save": "/usr/sbin/iptables-legacy-save",
        "/usr/sbin/ip6tables": "/usr/sbin/ip6tables-legacy",
        "/usr/sbin/ip6tables-restore": "/usr/sbin/ip6tables-legacy-restore",
        "/usr/sbin/ip6tables-save": "/usr/sbin/ip6tables-legacy-save",
      },
)

# An image for iptables
[
    oci_image(
        name = "iptables" + "_" + arch,
        architecture = arch,
        base = "//base:static" + "_" + "nonroot" + "_" + arch + "_debian11",
        tars = [
            # libc
            deb_pkg(arch, "debian11", "libc6"),

            # iptables
            deb_pkg(arch, "debian11", "iptables"),
            deb_pkg(arch, "debian11", "libip4tc2"),
            deb_pkg(arch, "debian11", "libip6tc2"),
            deb_pkg(arch, "debian11", "libxtables12"),
            deb_pkg(arch, "debian11", "libnfnetlink0"),
            deb_pkg(arch, "debian11", "libnetfilter-conntrack3"),
            deb_pkg(arch, "debian11", "libmnl0"),

            ":symlinks",
        ],
    )
    for arch in ARCHITECTURES
]

oci_image_index(
  name = "iptables",
  images = [
    ":iptables_" + arch
    for arch in ARCHITECTURES
  ]
)

load("//private/oci:defs.bzl", "sign_and_push_all")

oci_push(
    name = "publish",
    image = ":iptables",
    repository = "${HUB}/iptables",
    default_tags = ["latest"]
)

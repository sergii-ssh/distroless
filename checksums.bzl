# WARNING!!!
# DO NOT MODIFY THIS FILE DIRECTLY.
# TO GENERATE THIS RUN: ./updateWorkspaceSnapshots.sh

BASE_ARCHITECTURES = ["amd64", "arm64"]

# Exceptions:
# - s390x doesn't have libunwind8.
#   https://github.com/GoogleContainerTools/distroless/pull/612#issue-500157699
# - ppc64le doesn't have stretch security-channel.
#   https://github.com/GoogleContainerTools/distroless/pull/637#issuecomment-728139611
# - arm needs someone with available hardware to generate:
#   //experimental/python3/ld.so.arm.cache
ARCHITECTURES = BASE_ARCHITECTURES + ["arm", "s390x", "ppc64le"]

VERSIONS = [
    ("debian10", "buster"),
    ("debian11", "bullseye"),
]

DEBIAN_SNAPSHOT = "20210924T150024Z"

DEBIAN_SECURITY_SNAPSHOT = "20210923T193308Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "3530cbc6c78b6cadda80c10d949f511abd4a7f33d3492ed17d36a7ecc591a5fd",
            "updates": "6843a5d699f117b663d3f3264937902ca8d27f72c41a29158eea0f4e14a590c1",
            "security": "e204130d94c1e6cc3caea81f4037c1c28b9a6ed31455ac157feb542f51e0dd30",
        },
        "debian11": {
            "main": "2dd487cd20eabf2aaecb3371d26543cfaec0cc7e7dd0846f2aee6b79574374ad",
            "updates": "9d9184580240eb92ae0af4929191c180d13364f2d3f5258d79ae48d9f5f9f9ae",
            "security": "3895b8aff63457ad2d773f55aadaed45ad6156d3d116b99ee9e58dadfcd55baf",
        },
    },
    "arm": {
        "debian10": {
            "main": "7f51ba4df1837b4f5b299aa46e533fd006e2dc1b07727e7b32fe87bea9a8be5d",
            "updates": "dc2f8892a23ff27125993d38eed9efecb2dfd8b77ddd3f82483b71a90db2719e",
            "security": "b77439adc7fba4aa2f87a4ad2276b7ad2d0cd15a2cfb3c8d50ce8b9a7af9181c",
        },
        "debian11": {
            "main": "d9dc9d75483fccd9f6f47d6baf1cf3bae166eb8d706de87241fee649d165c0bd",
            "updates": "db4b24472c1ba2db9375a3f49e6421775483582a17d654db72eba3bf4d502f6c",
            "security": "f63a0d5604f83ae47d1c78422fcf2deeeb2ed0a38eaf2e8b9170d7e12a38c9c6",
        },
    },
    "arm64": {
        "debian10": {
            "main": "cf63979c9d3f7a411f30f62632626552436a583531a5bdcfc051d63fda8af8a3",
            "updates": "9851dabc9903095a5631f1e6980da1fd88051a01c5408748ba4333b6267e239b",
            "security": "4d6506ce3919a3472f79042c01e38ded258802c3a938284f2faa4887db822e02",
        },
        "debian11": {
            "main": "75d91cc94e87500c63d2808d440ec5197560ba45c5b80e5564c6d60e8ef95140",
            "updates": "5cfc5140dff68cf017e526d90ac8ec5144b0f6eef057c3d81164163326febd77",
            "security": "b36e91fb959f53262f460cf3f3b75f75f1471234b0d3a0102407433e343ebc48",
        },
    },
    "s390x": {
        "debian10": {
            "main": "449258775fd2d7f1a6b30cb5537c25ba9ef88b0b3a41269e61005de6d8a6fb5e",
            "updates": "b2e58f71a61ff5aa01004edfe3a0488d8ffaedb7e40dfdf01d949adb16d6c26b",
            "security": "e4b825e44535e1978c0cd463a9d41ca7d2cfe41484b09ea8310557850cc3541e",
        },
        "debian11": {
            "main": "0d738ded499cb12ddda2055e225ddeec3f5ec4e002b90af367dd526f71d74716",
            "updates": "139b3cc7e0dd5ea3d7f9daf5e637553018f2f0a3d60a64697141d25ce8083c14",
            "security": "fef401010876b6d49aaf3fd7b5759d6da79250df35f44c639402789d626fe122",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "2d4499fd08d0e2d73bee40c114198ac93098e8d14530e6f5e19a6838f5774b16",
            "updates": "02527ab580bc2e3ea72be997a0b3034d0d26d715ac5c3851ffca0752082f38ad",
            "security": "9258f0ee93a7043367873786f1fc86d8277ffa4eab354fc12407614d3da9b258",
        },
        "debian11": {
            "main": "af2cfa07996e2e5fb8dbb6e904b7f0910fcca79aee7bc25eed21ee0485fd9188",
            "updates": "f8b507c08fd49cbaec15916d1de4edd139a28e57ad718143c8f3656b6b551192",
            "security": "b8ecbf460daa5c2b406df27596a73a9ea61dcf6e19777684e8226be93ff341f8",
        },
    },
}

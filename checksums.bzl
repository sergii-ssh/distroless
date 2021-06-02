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
#   //experimental/python2.7/ld.so.arm.cache
ARCHITECTURES = BASE_ARCHITECTURES + ["arm", "s390x", "ppc64le"]

VERSIONS = [
    ("debian10", "buster"),
]

DEBIAN_SNAPSHOT = "20210602T144114Z"

DEBIAN_SECURITY_SNAPSHOT = "20210602T171141Z"

SHA256s = {
    "amd64": {
        "debian10": {
            "main": "b044c73a46671536011a26aedd8490dd31140538264ac12f26dc6dd0b4f0fcb8",
            "updates": "4eb0f1127acc753980a5073149c5cd145b1e9e3ca0800256911abbff2e0dd390",
            "security": "f4de00594c00f70ee80ac1f56a1aa657001b55f4890f62b791c3c309a8317402",
        },
    },
    "arm": {
        "debian10": {
            "main": "d5499221358080d6102d94c7a8b6f9a0ab5bf2f2eb19f13e1bfc040233dc7203",
            "updates": "6808fabdfb6660651ee3a098da13cc078549d09cc1a0ba0a1211dc1be8346ff3",
            "security": "08bb380ca0022895f7d361b3b9196064b38df18b0f4fd5fe1090220d3fad7e46",
        },
    },
    "arm64": {
        "debian10": {
            "main": "8872854ad36339c580342aac66895fbb57b9c84f9193c4e684b688e30f878069",
            "updates": "86fc791512ce019184d9c2408d751ff37b48f69442658082aec1ee8a71dea812",
            "security": "17fe47eb2af17e4ad93857d25dd67f6f825d9a1c8196cf48751c781ad532df7b",
        },
    },
    "s390x": {
        "debian10": {
            "main": "65a68a794a6127c63cd430216dda2cd62ab7bf43baffdae14f9356baa5e8e481",
            "updates": "6b08d1c5bf7a2f7c48f0cba99f067f6fd6b379e1fea1d03ab5facedf6c91e890",
            "security": "dfe1b613a0865c26749321381ba59c810a88e1e181022997ddc67dbc45a22aa6",
        },
    },
    "ppc64le": {
        "debian10": {
            "main": "9dc24a0b5943d38e877e599af865bdcc9ee9c5aa9f9708191195ab2f823d2c7e",
            "updates": "a551d6e7ce748baaaf283a1331148092847d9d178c84da1d426f7b66095cfe0f",
            "security": "b7ace3475c6cf42e6a2e12d1033625ba1cb23fc8ad1f8664ef3a3f5bbce2628a",
        },
    },
}

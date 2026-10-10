# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:d353041b354afa8fe361556060a0b49b099eeba694b24e1a990388c0a9e2481e
BASE_IMAGE_DIGEST_3.22-r3 := sha256:24d05a1d383c886fa9a5d90519f2c8cf92147a50e1c32eeffe8aadde39c0ce64
BASE_IMAGE_DIGEST_3.23 := sha256:74874681708c7f96e39b88ba3a800d33fe02d3831ba0240f4c70caa846264a28
BASE_IMAGE_DIGEST_3.23-r3 := sha256:2a602d2ee1122c28c34ff17be24d4e1b6fbafe8501981e3b488688e59ca4c051

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

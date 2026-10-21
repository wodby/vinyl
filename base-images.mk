# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:fb02a9369eb7330295fd0c2154796545d4a1745211a47c272a428fe1472305c6
BASE_IMAGE_DIGEST_3.22-r6 := sha256:075d54e103fb22bc6f223dd56b6371dfc937151a58f97a0912e7c968c73102d3
BASE_IMAGE_DIGEST_3.23 := sha256:23007584424896b3216eaa31690aac4981a597bc11dbfbce07396694d03ce064
BASE_IMAGE_DIGEST_3.23-r6 := sha256:80592b4bcbe332fa50312243bb2fb5bd073eb9deb9240422ade01eeefa6dd28c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:a9c49467167f5c2f8c3706c62ea64ebfe775e140e55b470ec50e824ddf15672d
BASE_IMAGE_DIGEST_3.22-r2 := sha256:1e7644e76c1a4a61c87481edc4776db15133675fc44f7302caec8545b44399b6
BASE_IMAGE_DIGEST_3.23 := sha256:2380edbd41a71a29ee7e68dc0f36bfb7cd5e95c6e097c40d2bbe7ec306192b7b
BASE_IMAGE_DIGEST_3.23-r2 := sha256:515d9f72e7c1ac47ff78db68c58f7ad572cc65929d84b97533f2f4f2aa7e1ca7

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

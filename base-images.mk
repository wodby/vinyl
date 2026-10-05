# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:c880bf2628026aa5bc60820ae1e2d0cd5bec7d2f56bf7c7f27874b90556adfb0
BASE_IMAGE_DIGEST_3.22-r2 := sha256:1e7644e76c1a4a61c87481edc4776db15133675fc44f7302caec8545b44399b6
BASE_IMAGE_DIGEST_3.23 := sha256:c5607f4db40d9f089c4bffb09c5f82213972edcd561e4f505934c3a70d22117c
BASE_IMAGE_DIGEST_3.23-r2 := sha256:515d9f72e7c1ac47ff78db68c58f7ad572cc65929d84b97533f2f4f2aa7e1ca7

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:f8bc5176f6c6fff7940aca61bc2a58d7b92f60ec23d7389043b71832c097168e
BASE_IMAGE_DIGEST_3.22-r2 := sha256:1e7644e76c1a4a61c87481edc4776db15133675fc44f7302caec8545b44399b6
BASE_IMAGE_DIGEST_3.23 := sha256:3465fc8b1c5e8229dfd8a04e811f622925caa8b6247e25cb40007263c87bfc29
BASE_IMAGE_DIGEST_3.23-r2 := sha256:515d9f72e7c1ac47ff78db68c58f7ad572cc65929d84b97533f2f4f2aa7e1ca7

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

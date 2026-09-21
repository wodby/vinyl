# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:4574e3d77f62769cef2b08f3655e7dc2c837ce907a54b1f0855b3c6244b519de
BASE_IMAGE_DIGEST_3.22-r0 := sha256:7e36a0f87d5558c7a92e862ca68fd3c4c82341b638b8a500a82fe275c8a70667
BASE_IMAGE_DIGEST_3.23 := sha256:ceebb4787005168f531d3ae01c6e53023e93ed9f6493ff9e092a01d16cf0b6ed
BASE_IMAGE_DIGEST_3.23-r0 := sha256:7bad6470d35321703c15cc6df13fae8ff689edbc44c6f0da0e7ae6efa909fabc

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

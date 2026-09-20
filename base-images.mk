# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:1520e7dc63012e4a82edc9400aeac24883fca19530451a126019c30dc8d2e526
BASE_IMAGE_DIGEST_3.22-r0 := sha256:7e36a0f87d5558c7a92e862ca68fd3c4c82341b638b8a500a82fe275c8a70667
BASE_IMAGE_DIGEST_3.23 := sha256:f733f2c1102cfa10e918520c78295d3c9c3af80be3e43219b3d089b87846de7f
BASE_IMAGE_DIGEST_3.23-r0 := sha256:7bad6470d35321703c15cc6df13fae8ff689edbc44c6f0da0e7ae6efa909fabc

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

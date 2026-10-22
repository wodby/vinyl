# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:ec7db226439eb2fefdf51c05e5ac37b7003ca2c15b653e7a90583878e2b48d6d
BASE_IMAGE_DIGEST_3.22-r7 := sha256:85d8c3ff6256058e2dc3512d0d06ccb1ae33fb20567c12ddc175cfe1947e26b2
BASE_IMAGE_DIGEST_3.23 := sha256:96f9419d458e0bcbd6c5ddc614f0cee9c7c5de08c502d0db02e022deb121ac93
BASE_IMAGE_DIGEST_3.23-r7 := sha256:f07a2f7d756f0a3b6d2969815ada519cc1a2c200e7c11ddc93f84f6afd55b9c1

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

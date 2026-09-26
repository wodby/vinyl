# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:6bb5b352f04357a3f737212f7af8ba5fc3602e9a0eeaf85799456056ca73f6c7
BASE_IMAGE_DIGEST_3.22-r1 := sha256:c2d447dc54d7f43e78f719caf6b4e188483aee72cbc15c61c37b790f9b9b2073
BASE_IMAGE_DIGEST_3.23 := sha256:312b76321f3a06f21df1492af6cbc17e1d9b735990f21946b16f3781f2f4fe6c
BASE_IMAGE_DIGEST_3.23-r1 := sha256:4fbd876dde1a2306fa2686e9d46ba774e0924894c666fdc8ee119848e2bb4c5f

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

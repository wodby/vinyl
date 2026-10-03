# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:b9da782c3ec6d3a47e8f2fe13e623905db7cc7d362a38a49afff1adf86b0a8b7
BASE_IMAGE_DIGEST_3.22-r1 := sha256:c2d447dc54d7f43e78f719caf6b4e188483aee72cbc15c61c37b790f9b9b2073
BASE_IMAGE_DIGEST_3.23 := sha256:44775a55924cef8809c05dcfb28ec8d7f07965f75e7b8b2ecb6fefd384bfac65
BASE_IMAGE_DIGEST_3.23-r1 := sha256:4fbd876dde1a2306fa2686e9d46ba774e0924894c666fdc8ee119848e2bb4c5f

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

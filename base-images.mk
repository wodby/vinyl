# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:9ae1d251b686cd4947f8b0f9ef1b2a1f2b9114f3c4ae3c5bd8fa5200c7120ad2
BASE_IMAGE_DIGEST_3.22-r11 := sha256:f05e0891871307c00fe75aed68c974d5b958cc7b7df9758ccf093494cb002c70
BASE_IMAGE_DIGEST_3.23 := sha256:09397ab19afd84a0bc9a465f4fb8982462c9b83a068662bf45e645f6bc27c5c5
BASE_IMAGE_DIGEST_3.23-r11 := sha256:1beb3313d1097f154446c701c9f7ba52cdbf91dffe3a1e96f417d0deded8e4c7

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

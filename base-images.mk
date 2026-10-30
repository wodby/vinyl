# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:62a138d95df76c14a866c09f2422a2ab76bfb2ca33fe2a43bc01bef6306a4be7
BASE_IMAGE_DIGEST_3.22-r11 := sha256:f05e0891871307c00fe75aed68c974d5b958cc7b7df9758ccf093494cb002c70
BASE_IMAGE_DIGEST_3.23 := sha256:f763d13140499751d910cfb61d9e18db3abe9fe813f6075c1fe3d0f33f3a45fd
BASE_IMAGE_DIGEST_3.23-r11 := sha256:1beb3313d1097f154446c701c9f7ba52cdbf91dffe3a1e96f417d0deded8e4c7

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

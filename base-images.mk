# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:6c0b9e0ca4d98ee16022b4dba2ae79a416904b73a434f23a230650910f5ad84f
BASE_IMAGE_DIGEST_3.22-r19 := sha256:672f8996bb82820b537930080c99bd420ccd5ee3377f335101cac93a93902931
BASE_IMAGE_DIGEST_3.23 := sha256:2ba572b7c24192e5d6b82519fa8df99aafa17f9f2325633a155c149bf7955a40
BASE_IMAGE_DIGEST_3.23-r19 := sha256:3385ca66ed38db73e9c0da4ff2e2f71d141edf6989594f1c867f5cd708c79a8c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

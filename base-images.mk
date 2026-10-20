# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:3301562fb393726b31fc996b6e888c7bbfebe4f9d1c689e44dcf6d1afe3ddee2
BASE_IMAGE_DIGEST_3.22-r5 := sha256:0b127087bec9016add000836163b7593814c7de792c23fb82b41c1954c0fab33
BASE_IMAGE_DIGEST_3.23 := sha256:de315fca851d64f4258ed5eb4460233829806e12b94ceebddeeb317605db208f
BASE_IMAGE_DIGEST_3.23-r5 := sha256:c09ffe81043e72dbd1abad8927bb8a1bdf4f02b9232efd958c3571b569b66930

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

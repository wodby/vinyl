# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:fcb49d64e581bc6043f0f14e1820620fa588294fa9176260e85a8847fdea8d8e
BASE_IMAGE_DIGEST_3.22-r10 := sha256:0c00f0cc76258647d966591bdf7145d4e55b63407274be8dd04a38441bcca10d
BASE_IMAGE_DIGEST_3.23 := sha256:fbe2de524868fa62fa54e46cdedcee5153effe6398b68596ba2624b4882153d0
BASE_IMAGE_DIGEST_3.23-r10 := sha256:f379cf2ac0feb86f4a81a48d0946c0d91dcd33290f01a0750b44a1cd7fef513b

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

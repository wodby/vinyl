# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:c13939fceeb42f45f0cb65092fbb5dd4a3cd7935f004ac193a3c1bff7bedaee3
BASE_IMAGE_DIGEST_3.22-r15 := sha256:d608b21f4e5c3c59363831892aa63f3c5f5d18bca676f246e14985404ca6310c
BASE_IMAGE_DIGEST_3.23 := sha256:d55686f682a480198a7fd150f05a88f07c31adc94bebff152f1003e5ef98387c
BASE_IMAGE_DIGEST_3.23-r15 := sha256:6c19100a84ee1aaf89f7874a43ff8affe41bed34271e300c30da7771dcc66e4d

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

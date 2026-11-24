# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:cf5fb6d966f56b01ad4822e81716b7f663dda2a1bf4c14e76f60b9700e0063a6
BASE_IMAGE_DIGEST_3.22-r18 := sha256:afa5775bc28fe3f6168aabbc81bf32adc4009b6c54f4a596ba6a11a056370ef2
BASE_IMAGE_DIGEST_3.23 := sha256:9eeb41107e6b8e8e9a813534e488f59f344f87da02e3b41ea53a6ad5975914a3
BASE_IMAGE_DIGEST_3.23-r18 := sha256:ea54873ef6a1191665049c3da771c0eb9ad0c1a08010817ea3e4eedf0a0bae31

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

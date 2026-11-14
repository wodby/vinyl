# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:8a301e12de70a06db080a0c23db6431c0396af0bdfaf8b2db6ad9709ff839bb3
BASE_IMAGE_DIGEST_3.22-r17 := sha256:3ac9db1b331e3fdb5a10537725279d7329e2582a486ac4ad73d9405c03556394
BASE_IMAGE_DIGEST_3.23 := sha256:106937f25b9ccb60cf1bc1da2e631112b3d8562a46b739b5be7e408d0eb9a37d
BASE_IMAGE_DIGEST_3.23-r17 := sha256:9b4adcc9a6b75bde5d412e7d35cf49daed721b17ad9d35116768a63a8179a295

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

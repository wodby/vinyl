# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:8b026e6df787edb2b3738ddbddd52b3cf9e1cd2b1b57150dc88ca2a94973716d
BASE_IMAGE_DIGEST_3.22-r17 := sha256:3ac9db1b331e3fdb5a10537725279d7329e2582a486ac4ad73d9405c03556394
BASE_IMAGE_DIGEST_3.23 := sha256:32dfc195a5e8b3d663f7046ac134e49cc55e714bdede67f79c2dd8a66e6494e2
BASE_IMAGE_DIGEST_3.23-r17 := sha256:9b4adcc9a6b75bde5d412e7d35cf49daed721b17ad9d35116768a63a8179a295

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

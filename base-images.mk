# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:759d32b231d9dc009f0694c55210ee13bfa589abce865808ac426d6457338736
BASE_IMAGE_DIGEST_3.22-r17 := sha256:3ac9db1b331e3fdb5a10537725279d7329e2582a486ac4ad73d9405c03556394
BASE_IMAGE_DIGEST_3.23 := sha256:4eaf64bfc83ec3b73749ddf00332ffdf0838bce0ba0171022b62c738f6ced4c7
BASE_IMAGE_DIGEST_3.23-r17 := sha256:9b4adcc9a6b75bde5d412e7d35cf49daed721b17ad9d35116768a63a8179a295

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

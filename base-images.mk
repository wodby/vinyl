# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:568f74908413b63620c38c09af13f92dd6395b655aa97350e18e25386174a3d4
BASE_IMAGE_DIGEST_3.22-r8 := sha256:c438762f04dba9d0b8ea7e300e40365d753bba31061c653a2f3fd6b76f4a9169
BASE_IMAGE_DIGEST_3.23 := sha256:c8f6f9fc06efe72bf8d34e6fb1a967c77128afec4996aea85d67d39b1effb290
BASE_IMAGE_DIGEST_3.23-r8 := sha256:6580da61e02cdd2273619eb2e4ea03700caf70b1c0c8de0e81e323e94215f838

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

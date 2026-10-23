# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:2113e3704b08a59d31fc75314da12e22eb6cebdaf1e8fcc02cafa50f0ebdfe8e
BASE_IMAGE_DIGEST_3.22-r8 := sha256:c438762f04dba9d0b8ea7e300e40365d753bba31061c653a2f3fd6b76f4a9169
BASE_IMAGE_DIGEST_3.23 := sha256:6eabcb61b505b6674e6b16705e72af64bce35876f4f9d4ca8d3a21d7ab3ffdc3
BASE_IMAGE_DIGEST_3.23-r8 := sha256:6580da61e02cdd2273619eb2e4ea03700caf70b1c0c8de0e81e323e94215f838

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

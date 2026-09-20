# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:2d849af0ecb3c1ea1170875bd2d4b6b9ec6fd478cc84197d718039f72bb676f5
BASE_IMAGE_DIGEST_3.22-2.20.8 := sha256:225b1e9920c0e9d0778c30fc1fc97c97de8ce2eff441c44fe1ab34d79a92b222
BASE_IMAGE_DIGEST_3.23 := sha256:cb9442379c5cdf01ba17c5054fa5320b7188dcbe918e1df035bb749b95bde47d
BASE_IMAGE_DIGEST_3.23-2.20.8 := sha256:97a0fa5605e88ab222015a788b6f45440f9f9f3b27b08904ffdb24225fcb2163

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

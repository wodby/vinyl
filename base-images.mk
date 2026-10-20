# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:77c16a6f88d7f41104306fdb55dd696b88c041f5efb9fb8d7af58a1f741f26d5
BASE_IMAGE_DIGEST_3.22-r5 := sha256:0b127087bec9016add000836163b7593814c7de792c23fb82b41c1954c0fab33
BASE_IMAGE_DIGEST_3.23 := sha256:70e56fbaf3c8ffaa548d8cd88d19d0764e73e418a8029c0ac458e2a5536e57a4
BASE_IMAGE_DIGEST_3.23-r5 := sha256:c09ffe81043e72dbd1abad8927bb8a1bdf4f02b9232efd958c3571b569b66930

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:77c16a6f88d7f41104306fdb55dd696b88c041f5efb9fb8d7af58a1f741f26d5
BASE_IMAGE_DIGEST_3.22-r6 := sha256:075d54e103fb22bc6f223dd56b6371dfc937151a58f97a0912e7c968c73102d3
BASE_IMAGE_DIGEST_3.23 := sha256:70e56fbaf3c8ffaa548d8cd88d19d0764e73e418a8029c0ac458e2a5536e57a4
BASE_IMAGE_DIGEST_3.23-r6 := sha256:80592b4bcbe332fa50312243bb2fb5bd073eb9deb9240422ade01eeefa6dd28c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:647f9f876130d043f2222d43a122d2db5846ce665741808052c8838bc26daf6a
BASE_IMAGE_DIGEST_3.22-r12 := sha256:e09b5587e914c6b970acb3fc8969a06ad9d196ba1b5f39806feaf8c7770ed04a
BASE_IMAGE_DIGEST_3.23 := sha256:21c67c8bd1618eb063b57c7822aa6257136d5cfc20e274cdc9c8f89fc28366d8
BASE_IMAGE_DIGEST_3.23-r12 := sha256:7d2e27535f0de03a7feab1e9e009945c3518f07cec9f48ab8efc642c1332ac84

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

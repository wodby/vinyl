# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:51279108c9fcd6a98cb53aa9cce76aa69270fe7e4b4fba8d00f4da144ef00d41
BASE_IMAGE_DIGEST_3.22-r14 := sha256:3f78de0684ebb3e43b966b3f5aed78e45a4385f3e07716cdc8de3a260d127406
BASE_IMAGE_DIGEST_3.23 := sha256:0317f573c52cbf30c8bed86ce9e97b8942feaad033c6dfc793fe7b72e8272aba
BASE_IMAGE_DIGEST_3.23-r14 := sha256:930ebdca2cb65fe4d6f0b222aea7e6c07dc977af64cddbfb6b28b23318cd1903

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

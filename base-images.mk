# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:c191bd3f13dd1c710445522e534c629074c5a6b4c37859cc5af4e608e572b847
BASE_IMAGE_DIGEST_3.22-r9 := sha256:bb7c20144cc590e7f15927d575dd36b84a2e02ddb236596cf2a16933145452ea
BASE_IMAGE_DIGEST_3.23 := sha256:f31d69967b4ec448a8392ffa59315e1091fcfd7c21b8f5e280edc0e5c862521a
BASE_IMAGE_DIGEST_3.23-r9 := sha256:acaec7a102407b5efb7d2f443cb146b638ea2b820c4544c9fdb34864b1a3fe23

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

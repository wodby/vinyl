# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:0930e84152dfa967b98cd2b6cc46e84ff7f0d840b7e90f1f850ea4c53ddd9ee7
BASE_IMAGE_DIGEST_3.22-r9 := sha256:bb7c20144cc590e7f15927d575dd36b84a2e02ddb236596cf2a16933145452ea
BASE_IMAGE_DIGEST_3.23 := sha256:bcedf37b5e270f2c0b4a7815fa11fc8bba6674a0c77372440a7f93d4a0436921
BASE_IMAGE_DIGEST_3.23-r9 := sha256:acaec7a102407b5efb7d2f443cb146b638ea2b820c4544c9fdb34864b1a3fe23

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

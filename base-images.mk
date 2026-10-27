# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:cc5abcca5fe98f0d4c505b03fdd3702a153d97816bf67a8fc1f110df4b2e181f
BASE_IMAGE_DIGEST_3.22-r9 := sha256:bb7c20144cc590e7f15927d575dd36b84a2e02ddb236596cf2a16933145452ea
BASE_IMAGE_DIGEST_3.23 := sha256:73881afb5b22825d98436077bc16d2345b6a8ea53dd7907f8a9ed30edfad70db
BASE_IMAGE_DIGEST_3.23-r9 := sha256:acaec7a102407b5efb7d2f443cb146b638ea2b820c4544c9fdb34864b1a3fe23

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

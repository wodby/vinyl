# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:bd0c2fa177365a5315c98492986797252a6874367fc1fc3080044a4e0edc7daa
BASE_IMAGE_DIGEST_3.22-r4 := sha256:5aa27653979467fff65bf8ce8fbe4f3acf4313f102f71f62ab415342aeb7c81b
BASE_IMAGE_DIGEST_3.23 := sha256:fb80ab26494bbe9d7ae660213d646d86afeea30727fd850cef31f9d326e75771
BASE_IMAGE_DIGEST_3.23-r4 := sha256:aa193f0dc3483f1a75b7093f53767980a5ccf48d6ec16c454d4e64573d834a51

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

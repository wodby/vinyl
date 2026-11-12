# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := wodby/alpine
BASE_IMAGE_VERSION_SUFFIX :=

BASE_IMAGE_DIGEST_3.22 := sha256:83b84a209a6695dd44b73d516ff339fcf95fb16e9cfb2ea7ecff305a1fedfd48
BASE_IMAGE_DIGEST_3.22-r16 := sha256:8074b1bd730942666978f7448d0d724acb5ef9659177645b2bce914458d67748
BASE_IMAGE_DIGEST_3.23 := sha256:d6b53bad8d1430977903812c8e79ef1ad1a8cc02638f9562e00eeb8a9a3319cd
BASE_IMAGE_DIGEST_3.23-r16 := sha256:8261a2137767d07612f42c02bcb2df51154fad14d8c609996d4418a4d1621644

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))

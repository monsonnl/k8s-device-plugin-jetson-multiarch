#/bin/bash
REPOSITORY=monsonnl/k8s-device-plugin-jetson-multiarch
VERSION="v0.9.9"
docker run --rm --privileged linuxkit/binfmt:v0.8
docker buildx create --use --name=qemu
docker buildx build --push --build-arg PLUGIN_VERSION=$VERSION --platform linux/arm64,linux/amd64 --tag $REPOSITORY:$VERSION -f Dockerfile.ubuntu20.04 ..

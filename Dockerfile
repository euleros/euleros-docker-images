FROM scratch

ARG ARCH
ARG OS_VERSION

ADD scripts/${ARCH}/EulerOS-${OS_VERSION}-${ARCH}.tar.xz /
CMD ["bash"]

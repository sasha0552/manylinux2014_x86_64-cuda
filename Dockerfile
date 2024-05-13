FROM quay.io/pypa/manylinux2014_x86_64:2024-05-13-63a1ad4
ARG distro=rhel7
ARG arch=x86_64
RUN yum-config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-$distro.repo && \
    yum --assumeyes install cuda-toolkit && \
    yum clean all && \
    rm -rf /var/cache/yum
ENV PATH="/usr/local/cuda/bin:$PATH"

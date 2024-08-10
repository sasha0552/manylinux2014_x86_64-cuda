FROM quay.io/pypa/manylinux2014_x86_64:2024.07.23-1
ARG distro=rhel7
ARG arch=x86_64
RUN yum-config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-$distro.repo && \
    yum --assumeyes install cuda-toolkit && \
    yum clean all && \
    rm -rf /var/cache/yum
RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
ENV PATH="/usr/local/cuda/bin:$PATH"

FROM atlas/centos7-atlasos
RUN yum install -y \
    python-virtualenv \
    python-pip \
    gcc \
    blas \
    java-1.8.0-openjdk.x86_64 \
    libtiff \
    && yum -y clean all
RUN mkdir /code
COPY custom_krb5.conf /etc/krb5.conf
COPY custom_ssh_config /etc/ssh/ssh_config
ENV ATLAS_LOCAL_ROOT_BASE="/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase"
COPY bashrc /root/.bashrc
RUN mkdir -p ~/.ssh
WORKDIR /code
COPY test.sh /code/
CMD ["/bin/bash"]
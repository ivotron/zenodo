FROM ubuntu:18.04

#ARG ZENODO_GIT_REPO="https://github.com/zenodo/zenodo"
#ARG ZENODO_BUILDER_IMAGE_NAME="popperized/zenodo-uploader"
#ARG ZENODO_GIT_REF="master"

#RUN apt update && \
#    apt install -y git docker.io && \
#    git clone --branch $ZENODO_GIT_REF --depth=1 $ZENODO_GIT_REPO && \
#    cd zenodo/ && \
#    ./install-deps.sh && \
#    apt install -y ccache python-prettytable python-requests && \
#    cd ../ && \
#    rm -rf ceph/ && \
#    apt autoclean && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
#    echo ${CEPH_BUILDER_IMAGE_NAME}:${CEPH_GIT_REF} > /builder-image
#
#ADD . /usr/bin/

ENTRYPOINT ["entrypoint.sh"]

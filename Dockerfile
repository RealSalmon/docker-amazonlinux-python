FROM amazonlinux:2017.03
MAINTAINER Ben Jones <ben@fogbutter.com>

ARG PYTHON_VERSION=3.6.2

RUN yum -y update &&\
    yum install -y findutils gcc sqlite-devel zlib-devel bzip2-devel openssl-devel readline-devel &&\
    yum -y autoremove &&\
    cd /usr/local/src &&\
    curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz &&\
    tar -xzf Python-${PYTHON_VERSION}.tgz &&\
    cd Python-${PYTHON_VERSION} &&\
    ./configure --enable-optimizations && make && make altinstall &&\
    cd ..&&\
    python3.6 -m venv /venv &&\
    rm -rf Python-${PYTHON_VERSION}* &&\
    printf "#!/bin/sh\nsource /venv/bin/activate\nexec \"\$@\"\n" > /entrypoint.sh &&\
    chmod +x /entrypoint.sh &&\
    cat /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


FROM amazonlinux:2017.03.1.20170812
LABEL maintainer="Ben Jones <ben@fogbutter.com>"
ARG PYTHON_VERSION=3.6.4
ARG BOTO3_VERSION=1.5.25
ARG BOTOCORE_VERSION=1.8.39

COPY entrypoint.sh /entrypoint.sh
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
    /venv/bin/pip install --no-cache boto3==${BOTO3_VERSION} botocore==${BOTOCORE_VERSION} &&\
    chmod +x /entrypoint.sh &&\
    rm -rf Python-${PYTHON_VERSION}* &&\
    yum clean all && \
    mkdir /python-testing && \
    /venv/bin/pip install --no-cache -t /python-testing \
      --install-option="--install-scripts=/usr/local/bin" \
      boto3==${BOTO3_VERSION} \
      botocore==${BOTOCORE_VERSION} \
      pytest \
      pytest-cov \
      moto

ENTRYPOINT ["/entrypoint.sh"]

FROM python:3.6.1-slim

RUN apt-get update && \
    apt-get install -y \
      vim \
      unzip \
      wget \
      curl \
      git \
      gcc \
      g++ \
      make \
      openjdk-7-jre

RUN mkdir /root/.pip
RUN echo '[global]' > /root/.pip/pip.conf
RUN echo 'index-url = https://zefr.jfrog.io/zefr/api/pypi/pypi/simple' >> /root/.pip/pip.conf

RUN pip install pytest-testrail

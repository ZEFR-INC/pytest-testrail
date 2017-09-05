FROM python:3.6.1-slim

RUN mkdir /root/.pip
RUN echo '[global]' > /root/.pip/pip.conf
RUN echo 'index-url = https://zefr.jfrog.io/zefr/api/pypi/pypi-local/simple' >> /root/.pip/pip.conf

RUN pip install pytest-testrail

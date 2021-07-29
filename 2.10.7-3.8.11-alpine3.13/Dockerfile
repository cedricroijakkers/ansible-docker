FROM python:3.8.11-alpine3.13

RUN apk add --no-cache gcc musl-dev python3-dev libffi-dev openssl-dev cargo && \
pip install pip --upgrade && \
pip install ansible==2.10.7 && \
apk add --no-cache sshpass && \
apk del --no-network gcc musl-dev rust cargo linux-headers libffi-dev openssl-dev python3-dev && \
ansible-galaxy collection install community.general

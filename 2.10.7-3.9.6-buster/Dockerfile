FROM python:3.9.6-buster

RUN pip install pip --upgrade && \
pip install ansible==2.10.7 && \
apt-get update -y && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends sshpass && \
apt-get clean && \
ansible-galaxy collection install community.general

FROM alpine:3.15

ENV PATH "/home/ansible/.local/bin:${PATH}"

RUN apk add python3 python3-dev gcc make musl-dev libffi-dev openssh --no-cache && \
    adduser -D ansible && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py

WORKDIR /home/ansible

USER ansible

RUN pip install ansible jmespath && ansible-galaxy install geerlingguy.docker geerlingguy.pip jnv.unattended-upgrades && ansible-galaxy collection install community.docker

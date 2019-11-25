FROM alpine:3.10
LABEL maintainer="Andrii Taryking <andrii.tarykin@securityrobot.io>"

RUN apk add python3 zsh vim git shadow --no-cache && apk add --virtual .build-deps python3-dev gcc make musl-dev \
    libffi-dev openssl-dev --no-cache && wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py && \
    pip install ansible && apk del .build-deps && useradd -m -s /bin/zsh ansible

WORKDIR /home/ansible

USER ansible

RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

CMD ["/bin/zsh"]


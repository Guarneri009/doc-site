# FROM node:slim
FROM ubuntu:20.04
#FROM amd64/ubuntu:20.04

#シェル指定 SHELL命令を使うとDockerfile内のRUNがどのシェル+引数によって実行されるかを指定できる。
# bash(1) から：
# -lログインシェルとして呼び出されたかのようにbashを動作させる
# -c -cオプションが存在する場合、コマンドは文字列から読み取られます。
# -c引数に渡されたコマンドを実行しています。 -lはログインシェルにするため、
# bashは最初に/etc/profileを読み取ります。
SHELL ["/usr/bin/bash", "-l", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

# RUN     apt-get update && \
#         apt-get install -y --no-install-recommends \
#         language-pack-ja-base \
#         language-pack-ja

# RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

# ロケール環境変数の優先順位
# LC_ALL（最優先）
# LC_で始まるカテゴリーごとの環境変数
# LANG（上の2つが設定されていない場合に適用）
ENV TZ=Asia/Tokyo
# ENV LANG=ja_JP.UTF-8
# ENV LANGUAGE=ja_JP:ja
# ENV LC_ALL=ja_JP.UTF-8

WORKDIR /opt
EXPOSE 3000

RUN     apt-get update && \
        apt-get install -y --no-install-recommends\
        sudo \
        tzdata \
        curl \
        git \
        wget \
        unzip \
        iputils-ping \
        net-tools \
        vim

# python3
RUN apt-get install -y --no-install-recommends build-essential libssl-dev libffi-dev python3-dev python3-pip

# for powerline-shell
RUN apt-get install -y --no-install-recommends fonts-powerline
RUN pip install powerline-shell
RUN echo -e 'function _update_ps1() { \n  PS1=$(powerline-shell $?)\n }' >> ~/.bashrc
RUN echo -e 'if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then\n    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"\nfi\n'  >> ~/.bashrc
RUN source ~/.bashrc

# for node NG
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# RUN export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" \
#         && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
#         && nvm install --lts \
#         && npm config set user 0 \
#         && npm config set unsafe-perm true

# for node
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh \
     && bash nodesource_setup.sh \
     && apt-get install -y nodejs \
     && npm install -g npm   


FROM debian:9

RUN apt-get update && apt-get -y install curl xz-utils

RUN curl -LO https://nodejs.org/dist/v6.11.2/node-v6.11.2-linux-x64.tar.xz && \
    tar -xvf node-v6.11.2-linux-x64.tar.xz && \
    cp -r node-v6.11.2-linux-x64/* /usr/local && \
    rm -rf node-v6.11.2-linux-x64 node-v6.11.2-linux-x64.tar.xz

RUN useradd -m express

RUN npm install -g express-generator

USER express
ENTRYPOINT ["express"]

FROM ubuntu:20.04


RUN apt-get update && apt-get install -y \
    git curl build-essential libssl-dev zlib1g-dev


RUN git clone https://github.com/TelegramMessenger/MTProxy.git /mtproxy


WORKDIR /mtproxy
RUN make


ENV SECRET=abcdef1234567890
ENV PORT=443


CMD ["./objs/bin/mtproto-proxy", "-u", "nobody", "-p", "443", "-H", "8888", "-S", "abcdef1234567890"]

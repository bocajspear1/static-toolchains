FROM alpine:latest as builder

RUN apk -U upgrade

RUN apk add gcc make patch g++ git

ARG BUILD_ARCH=unknown

WORKDIR /opt

RUN git clone https://github.com/richfelker/musl-cross-make.git /opt/musl-cross-make

RUN cd /opt/musl-cross-make && make TARGET=${BUILD_ARCH} && make install

FROM scratch as artifact
COPY --from=builder /opt/musl-cross-make/output ./output
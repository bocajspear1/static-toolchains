FROM alpine:latest as builder

RUN apk -U upgrade

RUN apk add gcc make patch g++ git

ARG BUILD_ARCH=unknown
ARG CPU_COUNT=1

WORKDIR /opt

RUN git clone https://github.com/richfelker/musl-cross-make.git /opt/musl-cross-make

WORKDIR /opt/musl-cross-make

RUN sed -E -i 's/tar (.)xvf /tar \1xf /g' Makefile

COPY config.mak /opt/musl-cross-make/config.mak

RUN echo "TARGET=${BUILD_ARCH}" >> config.mak && make -j${CPU_COUNT} && make install

RUN mkdir done; cd output; tar -zcf ../done/${BUILD_ARCH}-musl-toolchain.tar.gz *

FROM scratch as artifact
COPY --from=builder /done /done
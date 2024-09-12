FROM alpine:latest as builder

RUN apk -U upgrade

RUN apk add gcc make patch g++ git

ARG BUILD_ARCH=unknown
ARG CPU_COUNT=1

WORKDIR /opt

RUN git clone https://github.com/richfelker/musl-cross-make.git /opt/musl-cross-make

RUN sed -E -i 's/tar (.)xvf /tar \1xf /g' README

COPY config.mak /opt/musl-cross-make/config.mak

RUN cd /opt/musl-cross-make && make -j${CPU_COUNT} TARGET=${BUILD_ARCH} && make install

FROM scratch as artifact
COPY --from=builder /opt/musl-cross-make/output /output
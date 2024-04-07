FROM alpine:20231219

RUN echo "@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add \
    cmake=3.29.1-r0 \
    dfu-util@testing=0.11-r1 \
    g++-arm-none-eabi=13.2.0-r0 \
    gcc-arm-none-eabi=13.2.0-r0 \
    gdb-multiarch=14.2-r0 \
    make=4.4.1-r2 \
    py-pip=24.0-r0 \
    python3=3.11.8-r0 \
    stlink=1.8.0-r
RUN pip install --break-system-packages conan==2.1.0

ENV CONAN_HOME=/.conan2
RUN mkdir /.conan2 && chmod a+w -R /.conan2
COPY ./conan/ /etc/conan/

WORKDIR /root
COPY --chmod=0755 entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "entrypoint.sh" ]

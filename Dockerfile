# Node14.13.1-alpine3.10 + ffmpeg4.3.2
FROM node:14.13.1-alpine3.10

ENV TZ Asia/Taipei

# UTC+8
RUN apk add tzdata && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone 
#   && apk del tzdata

# Install latest ffmpeg
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz &&\
    tar Jxf ffmpeg-release-amd64-static.tar.xz && \
    rm ffmpeg-release-amd64-static.tar.xz &&\
    mv /ffmpeg-4.3.2-amd64-static/ff* /usr/sbin/

CMD ["ffmpeg", "--version"]

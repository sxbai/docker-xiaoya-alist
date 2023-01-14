#
# Dockerfile for xiaoyaliu/alist
#

FROM xiaoyaliu/alist:latest

CMD ["/bin/sh"]

LABEL MAINTAINER=i@nn.ci

VOLUME [/opt/alist/data/]

WORKDIR /opt/alist/

COPY /app/bin/alist ./ # buildkit

COPY entrypoint.sh /entrypoint.sh # buildkit

RUN /bin/sh -c apk add

ENV PUID=0 PGID=0 UMASK=022

EXPOSE map[5244/tcp:5244]

ENTRYPOINT ["/entrypoint.sh"]

RUN /bin/sh -c mkdir -p

RUN /bin/sh -c mkdir -p

COPY data.db /opt/alist/data/data.db # buildkit

COPY config.json /opt/alist/data/config.json # buildkit

COPY token /token # buildkit

COPY pikpak /pikpak # buildkit

RUN /bin/sh -c touch /mytoken.txt

COPY updateall /updateall # buildkit

COPY search /www/cgi-bin/search # buildkit

COPY header.html /www/cgi-bin/header.html # buildkit

COPY nginx.conf /etc/nginx/http.d/default.conf # buildkit

COPY docker-entrypoint.sh /entrypoint.sh # buildkit

RUN /bin/sh -c set -ex

RUN /bin/sh -c mv /usr/bin/rg

WORKDIR /opt/alist/

VOLUME [/opt/alist/data/]

EXPOSE map[5244/tcp:5244]

ENTRYPOINT ["/entrypoint.sh"]

CMD ["./alist" "server" "--no-prefix"]

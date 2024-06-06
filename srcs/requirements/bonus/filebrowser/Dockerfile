FROM alpine:3.18 as BASE

RUN apk add --no-cache curl

RUN curl -fsSL https://github.com/filebrowser/filebrowser/releases/download/v2.24.0/linux-386-filebrowser.tar.gz -o /tmp/filebrowser.tar.gz && \
	tar -xzvf /tmp/filebrowser.tar.gz -C /usr/local/bin && \
	rm /tmp/filebrowser.tar.gz

RUN mkdir -p /etc/filebrowser

RUN echo '{"port":8080, "baseURL":"","address":"0.0.0.0","log":"stdout","database":"/etc/filebrowser/database.db","root":"/srv"}' > /etc/filebrowser/filebrowser.json

FROM alpine:3.18

COPY --from=BASE /usr/local/bin/filebrowser /usr/local/bin/filebrowser
COPY --from=BASE /etc/filebrowser /etc/filebrowser

EXPOSE 8080

ENTRYPOINT ["filebrowser"]

CMD ["-c", "/etc/filebrowser/filebrowser.json"]

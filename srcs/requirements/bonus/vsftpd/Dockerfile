FROM alpine:3.18

ARG FTP_USR \
    FTP_PWD

RUN apk update && apk upgrade && \
    apk add --no-cache vsftpd

RUN adduser -h /var/www/ -s /bin/false -D ${FTP_USR} && \
    echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd && \
    adduser ${FTP_USR} root

RUN echo "listen=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "anonymous_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "anon_root=/ftp" >> /etc/vsftpd/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf && \
    echo "dirmessage_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "use_localtime=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "xferlog_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "xferlog_file=/var/log/vsftpd.log" >> /etc/vsftpd/vsftpd.conf && \
    echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf && \
    echo "connect_from_port_20=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "xferlog_std_format=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "ascii_upload_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "ascii_download_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "pasv_min_port=21100" >> /etc/vsftpd/vsftpd.conf && \
    echo "pasv_max_port=21110" >> /etc/vsftpd/vsftpd.conf && \
    echo "pam_service_name=vsftpd" >> /etc/vsftpd/vsftpd.conf


EXPOSE 21 21100-21110

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]

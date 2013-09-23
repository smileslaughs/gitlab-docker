FROM ubuntu:12.04

ADD ./etc/ssl_certs/ /etc/ssl_certs/gitlab

ADD ./etc/nginx/gitlab.example.config /etc/nginx/sites-available/gitlab_ssl

ADD ./etc/ssh/ /etc/ssh

ADD ./build/* /src/build
RUN chmod +x /src/build/install.sh
RUN /src/build/install.sh

EXPOSE 80
EXPOSE 443
EXPOSE 22

CMD ["/src/build/start.sh"]

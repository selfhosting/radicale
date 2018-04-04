FROM ubuntu:latest
MAINTAINER mickael@kerjean.me

RUN apt-get update && \
        mkdir data && \
        #####################
        # INSTALL APPLICATION DEPS
        apt-get install -y python3-pip git && \
        #####################
        # INSTALL APPLICATION
        python3 -m pip install --upgrade radicale && \
        #####################
        # CONFIGURATION
        # prepare radicale configuration
        mkdir -p ~/.config/radicale && cd ~/ && \
        # LDAP integration
        git clone https://github.com/marcoh00/radicale-auth-ldap && \
        cd radicale-auth-ldap && \
        python3 -m pip install --upgrade . && \
        #####################
        # INSTALL OTHER RELATED STUFF
        apt-get install -y apache2-utils curl ldap-utils && \
        #####################
        # CLEANUP
        apt-get -y clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*    
    
ADD config /root/.config/radicale
ADD entrypoint.sh /entrypoint.sh
EXPOSE 5232
VOLUME ["/data"]
WORKDIR "/data"
CMD ["bash", "/entrypoint.sh"]
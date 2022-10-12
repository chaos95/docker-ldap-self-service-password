FROM docker.io/ltbproject/self-service-password:${SSP_VERSION:-latest}

ENV SCRIPT_DIR /opt

# Add LSSP's config template
ADD ["assets/config/lssp/config.inc.php", "/var/www/conf/config.inc.local.php.dist"]

# Add scripts (i.e. entrypoint)
ADD ["assets/scripts/*", "${SCRIPT_DIR}/"]

RUN apt update && \
     apt install -y pwgen sudo gettext-base && \
     rm -rf /var/cache/apt && \
     chmod -R u+x ${SCRIPT_DIR}

CMD ${SCRIPT_DIR}/init.sh && apache2-foreground


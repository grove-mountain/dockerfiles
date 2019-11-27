ARG VAULT_VERSION=1.3.0
FROM vault:${VAULT_VERSION}

# All environment settings for this build.   
ENV ORACLE_PLUGIN_VERSION=0.1.6
ENV ORACLE_CLIENT_VERSION=19.5.0.0.0
ENV ORACLE_CLIENT_VERSION_SHORT=195000

ADD https://releases.hashicorp.com/vault-plugin-database-oracle/${ORACLE_PLUGIN_VERSION}/vault-plugin-database-oracle_${ORACLE_PLUGIN_VERSION}_linux_amd64.zip /tmp
ADD https://download.oracle.com/otn_software/linux/instantclient/${ORACLE_CLIENT_VERSION_SHORT}/instantclient-basic-linux.x64-${ORACLE_CLIENT_VERSION}dbru.zip /tmp

WORKDIR /tmp
RUN mkdir -p /tmp/lib /tmp/plugins
RUN unzip -d /tmp/plugins vault-plugin-database-oracle_${ORACLE_PLUGIN_VERSION}_linux_amd64.zip
RUN unzip -d /tmp/lib instantclient-basic-linux.x64-${ORACLE_CLIENT_VERSION}dbru.zip

FROM vault:${VAULT_VERSION}
RUN mkdir -p /vault/plugins /vault/lib

COPY --from=0 /tmp/plugins/vault-plugin-database-oracle /vault/plugins
COPY --from=0 /tmp/lib /vault/lib

RUN chown -R vault:vault /vault
RUN echo "/lib:/usr/lib:/usr/lib64:/vault/lib/$(ls /vault/lib)" > /etc/ld-musl-x86_64.path

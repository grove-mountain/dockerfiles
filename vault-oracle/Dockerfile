# First build stage downloads all necessary additional assets and places them in a well known location
FROM vault
ARG VAULT_VERSION
ARG ORACLE_PLUGIN_VERSION
ARG ORACLE_CLIENT_VERSION
ARG ORACLE_CLIENT_VERSION_SHORT
ADD https://releases.hashicorp.com/vault-plugin-database-oracle/${ORACLE_PLUGIN_VERSION}/vault-plugin-database-oracle_${ORACLE_PLUGIN_VERSION}_linux_amd64.zip /tmp
ADD https://download.oracle.com/otn_software/linux/instantclient/${ORACLE_CLIENT_VERSION_SHORT}/instantclient-basic-linux.x64-${ORACLE_CLIENT_VERSION}dbru.zip /tmp

WORKDIR /tmp
RUN mkdir -p /tmp/lib /tmp/plugins
RUN unzip -d /tmp/plugins vault-plugin-database-oracle_${ORACLE_PLUGIN_VERSION}_linux_amd64.zip
RUN unzip -d /tmp/lib instantclient-basic-linux.x64-${ORACLE_CLIENT_VERSION}dbru.zip

# Second build stage places the files in the desired location and sets the path for LD_LIBRARY_PATH
FROM vault
RUN mkdir -p /vault/plugins /vault/lib

COPY --from=0 /tmp/plugins/vault-plugin-database-oracle /vault/plugins
COPY --from=0 /tmp/lib /vault/lib

RUN chown -R vault:vault /vault
RUN echo "/lib:/usr/lib:/usr/lib64:/vault/lib/$(ls /vault/lib)" > /etc/ld-musl-x86_64.path

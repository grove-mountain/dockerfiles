FROM alpine:3.8 as builder

ENV CONSUL_TEMPLATE_VERSION=0.19.5
ENV ENVCONSUL_VERSION=0.7.3
ENV VAULT_VERSION=0.11.1

WORKDIR /tmp
ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz .
RUN tar -C /usr/local/bin -xzvf consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz
ADD https://releases.hashicorp.com/envconsul/${ENVCONSUL_VERSION}/envconsul_${ENVCONSUL_VERSION}_linux_amd64.tgz .
RUN tar -C /usr/local/bin -xzvf envconsul_${ENVCONSUL_VERSION}_linux_amd64.tgz
ADD https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip .
RUN unzip -d /usr/local/bin vault_${VAULT_VERSION}_linux_amd64.zip
RUN chmod 0755 /usr/local/bin/*


FROM rberlind/cats-and-dogs-backend:k8s-auth
COPY --from=builder /usr/local/bin/* /usr/local/bin/
ADD get_k8s_vault_token.sh /usr/local/bin/

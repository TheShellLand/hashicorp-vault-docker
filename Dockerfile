# HASHICORP VAULT
FROM ubuntu:20.04 as vault

ENV VAULT_DOWNLOAD https://releases.hashicorp.com/vault/1.6.3/vault_1.6.3_linux_amd64.zip
RUN apt update >/dev/null && apt install -y curl unzip
RUN curl -s $VAULT_DOWNLOAD > vault.zip && unzip vault.zip

# BASE
FROM ubuntu:20.04 as base

ENV SSH_USER ""
ENV SSH_PASSWORD ""
ENV SSH_CLIENT_SIGNER_PATH ""
ENV VAULT_URL ""
ENV VAULT_ADDR ""
ENV VAULT_TOKEN ""
ENV VAULT_SKIP_VERIFY ""

COPY entry.sh /

# Install Hashicorp vault
COPY --from=vault /vault /usr/bin/vault

ENTRYPOINT ["/bin/bash", "/entry.sh"]


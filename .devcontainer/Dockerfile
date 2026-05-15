FROM debian:bookworm-slim

COPY install.sh /app/install.sh
COPY config.json /etc/config.json
COPY show-link.sh /usr/local/bin/show-link.sh
COPY start.sh /usr/local/bin/start.sh

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       bash \
       git \
       curl \
       wget \
       unzip \
       tzdata \
       openssl \
       ca-certificates \
       uuid-runtime \
       tmux \
       jq \
       nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x /app/install.sh \
    && /app/install.sh

RUN sed -i 's/\r$//' /usr/local/bin/start.sh \
    && sed -i 's/\r$//' /usr/local/bin/show-link.sh \
    && chmod +x /usr/local/bin/start.sh \
    && chmod +x /usr/local/bin/show-link.sh

EXPOSE 443

CMD ["/bin/bash", "/usr/local/bin/start.sh"]

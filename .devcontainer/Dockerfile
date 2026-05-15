FROM debian:bookworm-slim

# Copy files
COPY install.sh /app/install.sh
COPY config.json /etc/config.json
COPY show-link.sh /usr/local/bin/show-link.sh
COPY start.sh /usr/local/bin/start.sh

WORKDIR /app

# Install dependencies
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

# Run installer
RUN chmod +x /app/install.sh \
    && /app/install.sh

# Make scripts executable
RUN chmod +x /usr/local/bin/show-link.sh \
    && chmod +x /usr/local/bin/start.sh

# Expose VLESS port
EXPOSE 443

# Start through script (UUID generation support)
CMD ["/usr/local/bin/start.sh"]

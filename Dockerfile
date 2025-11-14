FROM ghcr.io/wg-easy/wg-easy:latest

# Set environment variables for Cloud Run
ENV LANG=en \
    WG_HOST=0.0.0.0 \
    PASSWORD_HASH=$$2a$$12$$m1ogJnLJxVSAwKHntRDb4Om2Xh9usoxUxxpxOfjFK7v8q45pq0WRm \
    WG_DEFAULT_DNS=1.1.1.1 \
    PORT=51821

# Expose the WireGuard ports
EXPOSE 51820/udp
EXPOSE 51821/tcp

# The base image already has the correct entrypoint and CMD configured


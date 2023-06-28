# Base image
FROM tomcat:latest

# Set environment variables for Grafana Agent
ENV GRAFANA_AGENT_VERSION="0.19.0"

# Install Grafana Agent dependencies
RUN apt-get update \
    && apt-get install -y wget \
    && apt-get clean

# Download Grafana Agent binary
RUN wget https://github.com/grafana/agent/releases/download/v${GRAFANA_AGENT_VERSION}/grafana-agent-linux-amd64.zip \
    && unzip grafana-agent-linux-amd64.zip \
    && rm grafana-agent-linux-amd64.zip

# Rename the extracted Grafana Agent binary
RUN mv grafana-agent-linux-amd64 /usr/local/bin/grafana-agent

# Copy Grafana Agent configuration file
COPY grafana-agent-config.yml /etc/grafana-agent-config.yml

# Expose necessary ports
EXPOSE 9091

# Start Tomcat and Grafana Agent on container startup
CMD /usr/local/bin/grafana-agent --config.file=/etc/grafana-agent-config.yml


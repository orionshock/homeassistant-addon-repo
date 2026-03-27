ARG BUILD_FROM=python:3.12-slim
FROM ${BUILD_FROM}

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install git, curl, and jq for fetching app source and reading addon options
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    jq \
 && rm -rf /var/lib/apt/lists/*

# Clone the Home Services Logbook application source
RUN git clone --depth 1 https://github.com/orionshock/HomeServicesLogbook.git /tmp/hsl \
 && cp -r /tmp/hsl/app /app/app \
 && cp -r /tmp/hsl/static /app/static \
 && cp -r /tmp/hsl/templates /app/templates \
 && cp /tmp/hsl/requirements.txt /app/requirements.txt \
 && rm -rf /tmp/hsl

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# Create default data directories
RUN mkdir -p /data/uploads

# Copy and configure the addon startup script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]

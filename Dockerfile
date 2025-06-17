FROM ubuntu:latest

# Install prerequisites and add deadsnakes PPA for Python 3.10
RUN apt-get update && apt-get install -y \
    software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-distutils \
    python3-pip \
    git

# Create virtual environment and install packages
RUN python3.10 -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install PyYAML

# Add venv to PATH
ENV PATH="/venv/bin:$PATH"

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

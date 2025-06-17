FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  python3-venv \
  git

# Create a virtual environment and install PyYAML there
RUN python3.10 -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install PyYAML

# Set the virtualenv as default for python and pip
ENV PATH="/venv/bin:$PATH"

# Copy your application code
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

FROM art-hq.intranet.qualys.com:5006/secure/distroless/debian12/zing/java-nonroot:24.08.300.0-2-jre17.0.13.0.101

USER root

WORKDIR /home/app
ADD --chown=app:app ./target/github-was-action.jar /home/app/GitHubActionsQIAC-0.0.1-SNAPSHOT.jar

# Install dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    libffi-dev \
    git

# Create and activate a virtual environment
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Upgrade pip and setuptools within the virtual environment
RUN pip install --no-cache --upgrade pip setuptools

# Install Python packages
RUN pip install Qualys-IaC-Security

# Copy application files
COPY entrypoint.sh /entrypoint.sh
COPY resultParser.py /resultParser.py

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the container entrypoint
ENTRYPOINT ["sh", "/entrypoint.sh"]

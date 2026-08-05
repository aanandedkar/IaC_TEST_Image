FROM oraclelinux:8

# Install python3, git, pip
RUN yum install -y python3.11 git && yum clean all
RUN python3 -m ensurepip

# Install pip and setuptools
RUN pip3 install --no-cache-dir --upgrade pip setuptools

# Copy and install Qualys-IaC-Security from local .whl file
COPY qualys_iac_security-1.0.9.0-py3-none-any.whl /tmp/qualys_iac_security.whl
RUN pip3 install /tmp/qualys_iac_security.whl && rm /tmp/qualys_iac_security.whl

# Copy application files
COPY entrypoint.sh /entrypoint.sh
COPY resultParser.py /resultParser.py

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the container entrypoint
ENTRYPOINT ["sh", "/entrypoint.sh"]

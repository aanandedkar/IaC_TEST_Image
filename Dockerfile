FROM art-hq.intranet.qualys.com:5006/secure/oraclelinux:8

# Install python3, git, pip
RUN yum install -y python3.11 git && yum clean all
RUN python3 -m ensurepip

# Install pip, setuptools, and Qualys-IaC-Security from Nexus
RUN pip3 install --no-cache-dir --upgrade pip setuptools -i https://nexus3.intranet.qualys.com/nexus/repository/dev-pypi/simple
RUN pip3 install Qualys-IaC-Security -i https://nexus3.intranet.qualys.com/nexus/repository/dev-pypi/simple

# Copy application files
COPY entrypoint.sh /entrypoint.sh
COPY resultParser.py /resultParser.py

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the container entrypoint
ENTRYPOINT ["sh", "/entrypoint.sh"]

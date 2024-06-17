# Use an Ubuntu base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget gnupg software-properties-common && \
    apt-get install -y ffmpeg

# Install Shaka Packager
RUN wget -q -O - https://packages.shaka.org/ubuntu/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://packages.shaka.org/ubuntu focal main" > /etc/apt/sources.list.d/shaka-packager.list && \
    apt-get update && \
    apt-get install -y packager

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the script into the container
COPY decrypt_and_stream.sh /usr/local/bin/decrypt_and_stream.sh

# Make the script executable
RUN chmod +x /usr/local/bin/decrypt_and_stream.sh

# Set the entry point to the script
ENTRYPOINT ["/usr/local/bin/decrypt_and_stream.sh"]

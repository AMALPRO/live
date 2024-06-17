FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the FFmpeg script to the container
COPY run_ffmpeg.sh /run_ffmpeg.sh
RUN chmod +x /run_ffmpeg.sh

# Set the command to run when the container starts
CMD ["./start.sh"]

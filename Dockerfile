FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the FFmpeg script to the container
COPY run_ffmpeg.sh /start.sh
RUN chmod +x /start.sh
CMD ["./start.sh"]

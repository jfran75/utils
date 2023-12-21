
# Use Ubuntu 20.04 as base image
FROM ubuntu:20.04

# Avoid timezone prompt during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the system and install dependencies
# Install cc and g++
RUN apt-get update && apt-get install -y wget git make curl build-essential

# Download and run the Miniconda3 installation script
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
  bash ~/miniconda.sh -b -p /miniconda && \
  rm ~/miniconda.sh

# Add Miniconda3 to PATH
ENV PATH="/miniconda/bin:${PATH}"

# Initialize Conda for bash
RUN echo ". /miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
  echo "conda activate base" >> ~/.bashrc

WORKDIR /llama.cpp
RUN git clone https://github.com/ggerganov/llama.cpp.git . && \
  make && \
  python3 -m pip install -r requirements.txt

ENTRYPOINT ["./server", "-m", "/models/TheBloke/deepseek-coder-6.7B-instruct-GGUF/deepseek-coder-6.7b-instruct.Q8_0.gguf", "--ctx_size", "2048", "--threads", "8", "--host", "0.0.0.0", "--port", "8080"]

# Set the entrypoint to bash
# ENTRYPOINT ["tail", "-f", "/dev/null"]
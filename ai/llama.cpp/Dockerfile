
# Use Ubuntu 20.04 as base image
FROM ubuntu:20.04

# Avoid timezone prompt during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the system and install dependencies
RUN apt-get update && apt-get install -y wget git

# Download and run the Miniconda3 installation script
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
  bash ~/miniconda.sh -b -p /miniconda && \
  rm ~/miniconda.sh

# Add Miniconda3 to PATH
ENV PATH="/miniconda/bin:${PATH}"

# Initialize Conda for bash
RUN echo ". /miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
  echo "conda activate base" >> ~/.bashrc

# Set the entrypoint to bash
ENTRYPOINT ["tail", "-f", "/dev/null"]
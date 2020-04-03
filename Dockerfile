FROM pytorch/pytorch:1.1.0-cuda10.0-cudnn7.5-runtime

RUN apt-get update && apt-get install -y \
wget \
default-jdk \
git \
ssh-client

# setup SSH for root
USER root
RUN mkdir -p /root/.ssh && chmod 0700 /root/.ssh
RUN echo "StrictHostKeyChecking no" > /root/.ssh/config

# install conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b

# add miniconda to env path
ENV PATH="~/miniconda3/bin:${PATH}"

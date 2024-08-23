ARG CUDA_VERSION="12.2.2"
ARG UBUNTU_VERSION="22.04"
ARG DOCKER_FROM=nvidia/cuda:$CUDA_VERSION-devel-ubuntu$UBUNTU_VERSION
FROM $DOCKER_FROM AS base

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y --no-install-recommends git && \
    python3 -m pip install --upgrade pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install "trl<=0.9.0" peft==0.10.0 bitsandbytes==0.43.3 transformers[sentencepiece]==4.43.4
RUN python3 -m pip install torch==2.2.1+cu121 torchvision --index-url https://download.pytorch.org/whl/cu121
RUN python3 -m pip install "unsloth @ git+https://github.com/unslothai/unsloth.git@d0ca3497eb5911483339be025e9924cf73280178"
RUN python3 -m pip install --no-deps "xformers<0.0.26" --force-reinstall
RUN python3 -m pip install flash_attn==2.6.3

# Install ipython to interact
RUN python3 -m pip install ipython
CMD ["ipython"]

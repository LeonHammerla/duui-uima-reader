FROM nvidia/cuda:12.8.1-base-ubuntu22.04

RUN apt update && DEBIAN_FRONTEND=noninteractive \
    apt install --no-install-recommends -y \
    build-essential \
    software-properties-common \
    curl \
    python3-pip \
    python3-setuptools \
    python3-distutils \
    git && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Link python3 to python (optional, for convenience)
RUN ln -s /usr/bin/python3 /usr/bin/python

# Upgrade pip
RUN python -m pip install --upgrade pip
RUN python3 -m pip install setuptools

WORKDIR /usr/src/app

EXPOSE 9714

# ---------------------------------------------------------
# config
# ---------------------------------------------------------
# se-Version:
ARG BS_VERSION=0.1
ENV BS_VERSION=$BS_VERSION


# ---------------------------------------------------------
# ---------------------------------------------------------
# meta data
# ---------------------------------------------------------
# name
ARG TEXTIMAGER_ANNOTATOR_NAME="duui-bs_reader"
ENV TEXTIMAGER_ANNOTATOR_NAME=$TEXTIMAGER_ANNOTATOR_NAME
# version
ARG TEXTIMAGER_ANNOTATOR_VERSION=0.1
ENV TEXTIMAGER_ANNOTATOR_VERSION=$TEXTIMAGER_ANNOTATOR_VERSION

# service script
COPY ./requirements.txt ./requirements.txt


# requirements
RUN python3 -m pip install -r requirements.txt

COPY ./src/ ./src


WORKDIR /usr/src/app/src

# server
ENTRYPOINT ["uvicorn", "duui-bs_reader:app", "--host", "0.0.0.0", "--port", "9714"]
CMD ["--workers", "1"]
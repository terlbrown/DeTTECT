FROM python:3.8-alpine

LABEL version="1.3"

# update repository and install Linux packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash libc-dev build-base

# clone the newest version of DeTT&CT and install requirements
COPY . /opt/DeTTECT
WORKDIR /opt/DeTTECT
RUN pip install --no-cache-dir -r requirements.txt

# create an input and output directory
# within this directory, you can put your data source, technique and group YAML administration files.
RUN mkdir -p input
# within this directory, the output files from DeTT&CT are written. Such as ATT&CK Navigator layer files.
RUN mkdir -p output

# set an environment variable for the DeTT&CT Editor and expose port 8080
ENV DeTTECT_DOCKER_CONTAINER 1
EXPOSE 8080/tcp

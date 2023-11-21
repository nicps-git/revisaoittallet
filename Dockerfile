# syntax=docker/dockerfile:1

FROM ubuntu

# Set destination for COPY
WORKDIR /script

# Clonar script
RUN apt-get update && apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install traceroute -y

RUN git clone https://github.com/nicps-git/revisaoittallet.git
RUN cd ./revisaoittallet
RUN pwd
RUN chmod +x ./revisaoittallet/script.sh
RUN ./revisaoittallet/script.sh

# Builds your app with optional configuration
#RUN go build -o /revisaoscript

# Run
ENTRYPOINT ["/bin/bash", "/script/revisaoittallet/script.sh"]
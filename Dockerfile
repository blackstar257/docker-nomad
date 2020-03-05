FROM debian:latest
RUN apt update -y && apt install curl unzip -y && apt clean
ENV NOMAD_VERSION "0.10.4"
RUN curl --silent --remote-name https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip \
    && unzip nomad_${NOMAD_VERSION}_linux_amd64.zip \
    && chown root:root nomad \
    && mv nomad /usr/local/bin/ \
    && rm -f nomad_${NOMAD_VERSION}_linux_amd64.zip
RUN mkdir -p /etc/nomad.d /opt/nomad && chmod 700 /etc/nomad.d
CMD [ "nomad" ]
FROM ubuntu

RUN apt update && \
    apt install -y bash postgresql-client

WORKDIR /

ENTRYPOINT ["psql"]

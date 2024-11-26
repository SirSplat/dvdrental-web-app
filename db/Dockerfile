FROM sirsplat/dvdrental:latest

WORKDIR /code

COPY initdb.sh /docker-entrypoint-initdb.d/infra_initdb.sh

USER postgres

CMD ["postgres"]

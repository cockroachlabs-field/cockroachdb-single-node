FROM cockroachdb/cockroach:latest

LABEL maintainer="tjveil@gmail.com"

ADD init.sh /cockroach/
RUN chmod a+x /cockroach/init.sh

ADD logs.yaml /cockroach/
ADD optimizations.sql /cockroach/

WORKDIR /cockroach/

EXPOSE 8080
EXPOSE 26257

ENTRYPOINT ["/cockroach/init.sh"]
# CockroachDB Single Node
This project creates a simple [CockroachDB](https://www.cockroachlabs.com/) Docker image that is ideal for use in CI/CD pipelines or other functional tests.  The `Dockerfile` extends the latest CockroachDB [image](https://hub.docker.com/r/cockroachdb/cockroach), automatically [starts a single node](https://www.cockroachlabs.com/docs/stable/cockroach-start-single-node.html), and can automatically create a database if the environment variable `DATABASE_NAME` is provided.  If the environment variable `MEMORY_SIZE` is provided, CockroachDB will be started with an in-memory store with the given [size](https://www.cockroachlabs.com/docs/stable/cockroach-start-single-node.html#store).  The image is hosted on DockerHub and can be found [here](https://hub.docker.com/repository/docker/timveil/cockroachdb-single-node).

This project is especially useful when attempting to use CockroachDB as a [Service Container](https://docs.github.com/en/actions/using-containerized-services/about-service-containers) inside GitHub Actions.  Below is a snippet from a GitHub action `yml` file.  Notice the `cockroach` service defined as part of the `cockroachdb` job.  The `DATABASE_NAME` is provided as an `env` value.

```yaml
  # stuff happens above this...
  
  cockroachdb:
    runs-on: ubuntu-latest
    services:
      cockroach: # https://hub.docker.com/repository/docker/timveil/cockroachdb-single-node
        image: timveil/cockroachdb-single-node:latest
        env:
          DATABASE_NAME: benchbase
        ports:
          - 26257:26257
    steps:
      - name: Checkout repo.
        uses: actions/checkout@v2
      - name: Setup JDK 11.
        uses: actions/setup-java@v1
        with:
          java-version: 11
      - name: Build with Maven.
        run: mvn -B package --file pom.xml
  
  # stuff happens below this...
```

## Building the Image
```bash
docker build --no-cache -t timveil/cockroachdb-single-node:latest .
```

## Publishing the Image
```bash
docker push timveil/cockroachdb-single-node:latest
```

## Running the Image
```bash
docker run -d -it -p 8080:8080 -p 26257:26257 -e "DATABASE_NAME=test" -e "MEMORY_SIZE=.5" timveil/cockroachdb-single-node:latest
```
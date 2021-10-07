# cockroachdb-single-node
Simple single node docker image for testing


## Building the Image
```bash
docker build --no-cache -t timveil/cockroachdb-single-node:latest .
```

## Publishing the Image
```bash
docker push timveil/cockroachdb-single-node:latest
```s

## Running the Image
```bash
docker run -it -p 8080:8080 -p 25267:25267 timveil/cockroachdb-single-node:latest
```
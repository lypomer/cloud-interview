<div align="center">
  <h1>Application containerization instructions</h1>
</div>

## Introduction
This document will provide instructions to build the `apps/hello` and `apps/world` apps using docker and make them available in minikube.

## Prerequisites
- You may install the [docker compose](https://docs.docker.com/compose/) plugin (optional)
- You may have minikube started (optional)

## Building the apps
💡 Tip: To build the images and have them directly available in minikube, you may point docker to the minikube instance using the following command

```bash
eval $(minikube -p <profile> docker-env)
```

### Manually
For testing purposes you might want to build and run the application locally before deploying them in the cluster.

To do so you may set (or not) the `TAG` value in your shell and run the following commands
```bash
# Builds the hello app
docker build -t cloud-interview-hello:${TAG:-latest} apps/hello

# Builds the world app
docker build -t cloud-interview-world:${TAG:-latest} apps/world
```

### Using compose
For ease of use you may do the same in one line using docker compose
```bash
# Will build both apps with the same tags as above
docker compose build
```

## Launching the apps locally 
To test that they correctly work before deploying them

```bash
# To run the hello app on http://localhost:81
docker run --rm -p 81:3000 cloud-interview-hello:latest

# To run the world app http://localhost:82
docker run --rm -p 82:80 cloud-interview-world:latest
```

or using docker compose
```bash
# Start both apps
docker compose up --force-recreate
```

## Pushing the apps to minikube
If you didn't build the images directly in the minikube registry you will have to push them manually.

To to so run the following command, where `${IMAGE}` is either `cloud-interview-hello` or `cloud-interview-world` and `${TAG:-latest}` the variable used to build the images

```bash
minikube image load ${IMAGE}:${TAG:-latest}
```
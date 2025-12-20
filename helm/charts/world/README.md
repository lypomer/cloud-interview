<div align="center">
  <h1> 🌎 World Chart</h1>
</div>

## Introduction
This chart packages the world app to deploy in a kubernetes cluster to display the http://ornikar.dev/world site.

## Prerequisite
- [Kubernetes](https://kubernetes.io/) >= 1.14
- [Helm](https://helm.sh/) >= v3.19.2

## Installation
You may install the chart with default values using the following command

```bash
# In the current namespace
helm upgrade --install world world

# With a particular image version
helm upgrade --install --set image.tag=${TAG:-latest} world world

# In a dedicated namespace
helm upgrade --install world world --create-namespace -n world
```

## Configuration
To generate a default values file for eazy customization run the following

```bash
helm show values world > world-values.yaml
```

### Values
| Key                 | Type | Default                                                                      | Description                               |
|---------------------|------|------------------------------------------------------------------------------|-------------------------------------------|
| traefik.enabled     | bool | true                                                                         | whether to use traefik to route requests  |
| traefik.middlewares | list | {"name": "stripprefix", "spec": {"stripPrefix":{"prefixes": ["/world"]} }}   | Add traefik middleware configuration here |
| ingress.enabled     | bool | true                                                                         | whether to deploy ingress                 |
| ingress.hosts       | list | {"host": "ornikar.dev", "paths": [{"path": "/world", "pathType": "Prefix"}]} | The ingress hosts configuration           |
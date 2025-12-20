<div align="center">
  <h1>👋 Hello Chart</h1>
</div>

## Introduction
This chart packages the hello app to deploy in a kubernetes cluster to display the http://ornikar.dev/hello site.

## Prerequisite
- [Kubernetes](https://kubernetes.io/) >= 1.14
- [Helm](https://helm.sh/) >= v3.19.2

## Installation
You may install the chart with default values using the following command

```bash
# In the current namespace
helm upgrade --install hello hello

# In a dedicated namespace
helm upgrade --install hello hello --create-namespace -n hello
```

## Configuration
To generate a default values file for eazy customization run the following

```bash
helm show values hello > hello-values.yaml
```

### Values
| Key                 | Type | Default                                                                      | Description                               |
|---------------------|------|------------------------------------------------------------------------------|-------------------------------------------|
| traefik.enabled     | bool | true                                                                         | whether to use traefik to route requests  |
| traefik.middlewares | list | {"name": "stripprefix", "spec": {"stripPrefix":{"prefixes": ["/hello"]} }}   | Add traefik middleware configuration here |
| ingress.enabled     | bool | true                                                                         | whether to deploy ingress                 |
| ingress.hosts       | list | {"host": "ornikar.dev", "paths": [{"path": "/hello", "pathType": "Prefix"}]} | The ingress hosts configuration           |
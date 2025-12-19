<div align="center">
  <h1>Traefik installation instructions</h1>
</div>

## Introduction
This file aims at providing an automated [traefik](https://doc.traefik.io/traefik/) installation script and network configuration for the rest of the exercice.

It will install [v38.0.0](https://artifacthub.io/packages/helm/traefik/traefik/38.0.0) of the chart and map Minikube's IP to the traefik LoadBalancer external IP ensuring external communication.

🚨 The script will also map Minikube's IP to `ornikar.dev`in your `etc/hosts` to allow domain resolution. You will be prompted for your `sudo` password if the entry is missing.

## Prerequisites 
The scripts requires the following binary to run: [helm](https://helm.sh/)

## Usage
From the root of the repository, change directory to the script folder
```bash
# Go to the script folder
cd scripts
```

Then run the script
```bash
# Install the latest version
./traefik-install.sh
```

### Details
The script will:
1. Check [installation requirements](#prerequisites)
2. Start minikube
3. Configure the `ornikar.dev` host if missing
4. Add the traefik helm repository if missing
5. Install traefik in its own namespace

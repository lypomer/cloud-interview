<div align="center">
  <h1>Minikube installation instructions</h1>
</div>

## Introduction
This file aims at providing an automated [minikube](https://minikube.sigs.k8s.io/docs/) installation script for UNIX based systems (MacOS, Linux)

## Prerequisites 
The scripts requires the following binary to run: [curl](https://curl.se)

## Usage
From the root of the repository, change directory to the script folder
```bash
# Go to the script folder
cd scripts
```

Then run the script
```bash
# Install the latest version
./minikube-install.sh

# Or install a specific version
./minikube-install.sh v1.37.0
```

👉 You may check the script usage using the `--help` option

The script will:
1. Check install requirements
2. Download the minikube binary
3. Install the binary
4. Cleanup the downloaded artefact

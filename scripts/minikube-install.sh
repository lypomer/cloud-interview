#!/bin/bash

case "$1" in
  --help | -h)
    echo "Usage: $0 <minikube-version>"
    echo "Where <minikube-version> is a valid release version tag (defaults to 'latest')"
    echo "Check their release page: https://github.com/kubernetes/minikube/releases"
    exit 0
    ;;

  *)
    ;;
esac

# ------------------------------ prerequisites ------------------------------ #
yellow='\033[33m'
red='\033[31m'
reset='\033[0m'

# Check common requirements
# Optional
#docker being the most common container manager
which docker 2>&1 >/dev/null || echo -e "${yellow}Warning: Docker not found, do you have a container or virtual machine manager installed ?${reset}"

# Mandatory
set -e
which curl 2>&1 >/dev/null || (echo -e "${red}Error: You must have curl (https://curl.se) installed to run this script${reset}"; exit 1)

# ---------------------------------- init ----------------------------------- #
# OS information to select the right binary
os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m | sed 's/x86_64/amd64/g')
file_name="minikube-${os}-${arch}"
version=${1:-latest}
base_release_url="https://github.com/kubernetes/minikube/releases"

# Handle latest download URL edge case
if [[ version -eq "latest" ]];then
    release_url="${base_release_url}/${version}/download"
else
    release_url="${base_release_url}/download/${version}"
fi

# --------------------------------- install --------------------------------- #
echo -e "Installing ${file_name} ($version)"

echo -e "\t> download"
curl --fail -LO "${release_url}/${file_name}"

echo -e "\n\t> install"
sudo install ${file_name} /usr/local/bin/minikube

echo -e "\n\t> cleaning"
rm ${file_name}

echo "Installation complete, run 'minikube version' to verify installation"
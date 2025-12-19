#!/bin/bash

# Get script folder for constant behavior
script=$0
script_folder=$(dirname $script)
script_folder_path=$(readlink -f $script_folder)

# ------------------------------ prerequisites ------------------------------ #
yellow='\033[33m'
red='\033[31m'
reset='\033[0m'

# Check script requirements
# Mandatory
set -e
which helm 2>&1 >/dev/null || (echo -e "${red}Error: You must have helm (https://helm.sh/) installed to run this script${reset}"; exit 1)

# --------------------------------- install --------------------------------- #
# Start minikube
echo ">Starting Minikube"
minikube start

# Networking setup
minikube_ip=$(minikube ip)
target_host="ornikar.dev"
host_file="/etc/hosts"
target_host_present=$(grep -iE "$minikube_ip.*$target_host" $host_file || true)

if [[ -z $target_host_present ]]; then
    echo -e "${yellow}Minikube started at $minikube_ip, but $target_host missing for resolution"
    echo "Updating $host_file (sudo privileges required)${reset}"
    echo  "$minikube_ip $target_host" | sudo tee -a $host_file > /dev/null
fi

# Prepare traefik install
echo -e "\n>Preparing traefik installation"
traefik_repo=https://traefik.github.io/charts
traefik_repo_set=$(helm repo list | grep traefik)
if [[ -z $traefik_repo_set ]];then
    echo "Adding traefik helm repository"
    helm repo add $traefik_repo  || true
fi
helm repo update

# Install traefik
traefik_version="38.0.0"
traefik_values_path=$(readlink -f "${script_folder_path}/../helm/values/traefik/values.yaml")
echo -e "\n>Installing: traefik in Minikube" 
echo "- chart version: ${traefik_version}"
echo "- values: ${traefik_values_path}"
helm upgrade --install traefik traefik/traefik --version $traefik_version \
    -f $traefik_values_path --set "service.externalIPs={${minikube_ip}}" \
    --create-namespace -n traefik

echo -e "\n>Traefik installed and configured as an HTTP IngressController"
echo "The LoadBalancer external IP (${minikube_ip}) will resolve to ${target_host}"

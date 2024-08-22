# NGINX Ingress Controller Installation

This document provides instructions for installing the NGINX Ingress Controller in a Kubernetes cluster using Helm.

## Prerequisites

- A Kubernetes cluster
- Helm installed on your local machine
- kubectl configured to interact with your cluster

## Installation Steps

1. **Add the Ingress NGINX repository:**
   ```bash
   helm repo add ingress-nginx https://charts.nginx.org
   helm repo update
   ```

2. **Install the Ingress controller:**
   ```bash
   helm install my-nginx ingress-nginx/ingress-nginx
   ```

   Replace `my-nginx` with your desired release name.

3. **Verify the installation:**
   ```bash
   kubectl get pods -n ingress-nginx
   ```

   Ensure that the NGINX Ingress Controller pods are running.

## Usage

After installation, you can configure Ingress resources to manage external access to your services.

## Uninstallation

To uninstall the Ingress controller, run:
```bash
helm uninstall my-nginx
```

## License

This project is licensed under the MIT License.

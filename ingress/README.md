
## Overview

Your Ingress Controller is a powerful tool that simplifies and manages external access to services within your Kubernetes cluster. It seamlessly integrates with the Kubernetes Ingress resource to provide robust routing, load balancing, and SSL/TLS termination for your applications.

## Features

- **Dynamic Routing:** Easily configure and manage routing rules using the Kubernetes Ingress resource.
- **Load Balancing:** Distribute incoming traffic across multiple backend services to ensure optimal performance and availability.
- **SSL/TLS Termination:** Secure your applications with automatic SSL/TLS certificate management.
- **Customization:** Fine-tune the behavior of your Ingress Controller with a wide range of configuration options.
- **Monitoring and Logging:** Gain insights into your application's traffic and diagnose issues with integrated monitoring and logging support.

## Quick Start

### Installation

```bash
# Install Metallb loadbalancer
git clone git@github.com:sourabhdey21/kubernetes.git
kubectl  apply -f kubernetes/ingress/metallb/
# The Output should be like these one if everything has been setup correctly
kubectl  get pods -A

metallb-system   controller-786f9df989-rttk5                     1/1     Running     0          50m
metallb-system   speaker-zhx8s                                   1/1     Running     0          50m

# Install Nginx ingress  Controller using helm/manifest
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace

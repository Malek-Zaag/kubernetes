
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

# Check the ingress controller status
kubectl   -n ingress-nginx  get all


NAME                                            READY   STATUS    RESTARTS   AGE
pod/ingress-nginx-controller-6dc8c8fdf4-tp77v   1/1     Running   0          49m

NAME                                         TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)                      AGE
service/ingress-nginx-controller-admission   ClusterIP      10.43.39.123   <none>          443/TCP                      49m
service/ingress-nginx-controller             LoadBalancer   10.43.69.84    192.168.1.202   80:31724/TCP,443:31205/TCP   49m

NAME                                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/ingress-nginx-controller   1/1     1            1           49m

NAME                                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/ingress-nginx-controller-6dc8c8fdf4   1         1         1       49m


#Deploy application for ingress controller 
kubectl  apply -f ingress/ingress-demo/

# View the ingress resources
kubectl  get ingress

NAME                 CLASS   HOSTS               ADDRESS         PORTS   AGE
ingress-resource-1   nginx   nginx.example.com   192.168.1.202   80      52m


#Describe ingress resources
kubectl describe ing ingress-resource-1

Name:             ingress-resource-1
Labels:           <none>
Namespace:        default
Address:          192.168.1.202
Ingress Class:    nginx
Default backend:  <default>
Rules:
  Host               Path  Backends
  ----               ----  --------
  nginx.example.com
                     /   nginx-deploy-main:80 (10.42.0.15:80,10.42.0.16:80,10.42.0.17:80 + 1 more...)
Annotations:         <none>
Events:
  Type    Reason  Age                From                      Message
  ----    ------  ----               ----                      -------
  Normal  Sync    52m (x2 over 52m)  nginx-ingress-controller  Scheduled for sync


#Check if the container is accessible or not
# Add entries in hosts file
/etc/hosts
192.168.1.202 nginx.example.com    --> put the controller loadbalancer Ipaddress

## curl nginx.example.com

<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>


![image](https://github.com/sourabhdey21/kubernetes/assets/98477908/f7a56e6a-6eb9-43b5-936a-541fbf5e1583)


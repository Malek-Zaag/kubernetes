🚀 To install cert-manager using Helm, follow these steps:

1. 🔄 Add the Jetstack Helm repository:
```
helm repo add jetstack https://charts.jetstack.io --force-update
```
2. 🚀 Install cert-manager:
```
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.15.3 \
  --set crds.enabled=true
```
🎉 This command will install cert-manager with the specified version and enable the creation of Custom Resource Definitions (CRDs).

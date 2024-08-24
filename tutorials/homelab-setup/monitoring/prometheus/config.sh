  helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
  helm repo add stable https://charts.helm.sh/stable
  helm install prometheus prometheus-community/kube-prometheus-stack
  kubectl expose deployment prometheus-grafana --type=LoadBalancer --name=prometheus-grafana --port=80 --target-port=3000
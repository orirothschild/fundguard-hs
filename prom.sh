helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
ALERT_NAME=prometheus-alerts
helm install es-exporter prometheus-community/prometheus-elasticsearch-exporter
kubectl create configmap ${ALERT_NAME} --from-file=prometheus/alerts/ --namespace=prometheus -o yaml --dry-run | kubectl apply -f -
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack --namespace=prometheus --create-namespace -f prometheus/alerts/elastic-alerts.yaml
kubectl apply -f prometheus/service-monitor.yaml

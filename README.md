Elasticsearch and Prometheus Setup
This repository contains scripts and configuration files to deploy an Elasticsearch cluster alongside Prometheus for monitoring and alerting. The setup includes the Elasticsearch Operator, Elasticsearch Exporter, and Prometheus with custom alert rules.

Repository Structure
plaintext
Copy code
.
├── README.md
├── deploy.sh
├── es
│   ├── es.sh
│   └── es.yaml
├── kibana
│   ├── gcr.json
│   ├── kibana.sh
│   └── kibana.yaml
└── prometheus
    ├── alerts
    │   └── elastic-alerts.yaml
    ├── prom.sh
    ├── service-monitor.yaml
    └── values.yaml
Installation Guide

1. start Minikube


1. Deploy Elasticsearch
To deploy the Elasticsearch cluster, start Minikube and run the es.sh script from the root level of the repository. This script will download the relevant CRDs and apply the es.yaml file to bring the system up to date.

'''sh ./es/es.sh'''

After running the script, ensure that the Elasticsearch cluster is up and running. You can verify this and get the initial password using the following commands:
kubectl port-forward service/quickstart-es-http 9200
PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')
curl -u "elastic:$PASSWORD" -k "https://localhost:9200"


2. Deploy Prometheus and Elasticsearch Exporter
To deploy Prometheus and the Elasticsearch Exporter, run the prom.sh script from the root level of the repository. This script will add the Prometheus Helm repository, update it, install the Elasticsearch Exporter, create a ConfigMap for custom alerts, and install/upgrade Prometheus with custom alert rules.

bash ./prometheus/prom.sh

The script performs the following steps:

Adds the Prometheus community Helm chart repository.
Updates the Helm chart repository index.
Sets a variable for the alert ConfigMap name.
Installs the Elasticsearch Exporter Helm chart.
Creates a ConfigMap from the alerts/ directory for custom alert rules.
Installs or upgrades the Prometheus stack using the custom alert rules specified in elastic-alerts.yaml.
Applies the ServiceMonitor configuration to enable Prometheus to scrape metrics from the Elasticsearch Exporter.
Service Monitor Configuration
The service-monitor.yaml file is used to configure Prometheus to scrape metrics from the Elasticsearch Exporter. 


These alerts will trigger based on the health status and node count of the Elasticsearch cluster, helping you monitor its status and respond to issues promptly.
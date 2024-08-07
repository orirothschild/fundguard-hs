kubectl create -f https://download.elastic.co/downloads/eck/2.13.0/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/2.13.0/operator.yaml
kubectl apply -f elastic-search/elastic-search.yaml
# kubectl port-forward service/quickstart-es-http 9200
# PASSWORD=$(kubectl get secret quickstart-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')
# curl -u "elastic:$PASSWORD" -k "https://localhost:9200"
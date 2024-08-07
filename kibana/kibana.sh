kubectl apply -f kibana/kibana.yaml

# kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo

# export ES_BASIC_AUTH_USER=elastic
# export ES_BASIC_AUTH_PASSWORD=137Q7Uk0rDS49yk9japT0L4I


# elasticsearch-faker generate --doc-template gcr.json  https://localhost:9200 -n 10000
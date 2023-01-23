# Components included
This deployment consist of a full blown Prometheus monitoring stack. Including the following components:

- Prometheus
- Grafana
- Node-exporter
- Pushgateway
- Alertmanager
- Kube-state-metrics

# Things to consider before deployment

- Think about changing the `storageClass` within all `pvc.yaml` files to a storage class which can be mounted on all cluster nodes (like NFS).
- Update the `ingress.yaml` under `grafana/ingress.yaml` according to your needs and ingress controller.
- Adjust the `kustomization.yaml` in the root directory according to your needs. You may not want to deploy all the components that are included in this kustomization.
- If you decide *not* to deploy all components included here, you may need to adjust the scrape configuration of Prometheus under `prometheus/configmap.yaml`.
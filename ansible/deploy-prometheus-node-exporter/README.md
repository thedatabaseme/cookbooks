# Deploy Prometheus Node Exporter

This playbook can be used to deploy a running Prometheus Node Exporter on a Debian based
OS (e.g. Debian, Ubuntu...). In addition to the Node Exporter, a push script is created
and a respective crontab entry (as root) to push the Node Exporter metrics regularly to
a Pushgateway (see `push_node_exporter_metrics.sh.j2`).

The playbook expects two parameters to run properly:
- `pushgateway_server`
- `pushgateway_port`

## Example playbook call

This call will run the playbook on all hosts of your inventory (`hosts` file). To limit
the hosts to run the playbook on, use the `--limit` parameter of `ansible-playbook`.

```bash
ansible-playbook deploy-node-exporter.yml -i hosts -e "pushgateway_server=mypushgateway pushgateway_port=8120"
```
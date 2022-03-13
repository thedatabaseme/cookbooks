# zalando-postgres-operator

Simple kustomization deployment of the Zalando Postgres Operator.

Apply the deployment via kubectl can be done like this:

```
kubectl apply -k overlays/dev/
```

If you want to deploy the Operator UI in addition, you can do so by applying the `ui` deployment.
You may want to adjust the hostname of your ingress rule within `ui/ingress.yaml`. The deployment
of the UI requires an Ingress controller of some sort.

```
kubectl apply -k ui/
```

# actions-runner-operator

There is a known issue in the operator repository. When applying the kustomization using `kubectl apply`,
you will receive an error message like `metadata.annotations: Too long: must have at most 262144 bytes`.

To avoid this error, use `--server-side` when using `kubectl apply`, e.g.:

```
kubectl apply -k base/ --server-side
```
# Configuration
To configure metallb to your needs, adjust the IP address-ranges in the configmap.yaml before applying the kustomization.

# Install metallb

To install metallb on your system, apply the kustomization file under overlays/dev:
```
kubectl apply -k overlays/dev/
```

This will apply a Namespace `metallb-system`, a Configmap with the wanted IP Range and metallb itself (from an Internet resource)
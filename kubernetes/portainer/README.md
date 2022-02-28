# Portainer Deployment

This kustomization deployment is basically the same that can be found under
https://raw.githubusercontent.com/portainer/k8s/master/deploy/manifests/portainer/portainer.yaml.
with the exception that the unneeded Nodeport configuration of the Service is not used.
Instead, we use an Ingress rule. This scenario cannot be found in the official portainer
documentation when you not want to use Helm.

# Ingress

You need to adjust the URL in the Ingress rule definition (`ingress.yaml`) to your needs.

# PVC

The PVC uses the default Storage Class, if you haven't defined a default Storage Class, the
deployment of the PVC will fail!

# Portainer Version

The manifest uses the `latest` version TAG of Portainer. This might not fit your needs and you
should switch to a specific version instead.
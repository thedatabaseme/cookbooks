# ingress-nginx kustomization overlay

This Kustomization overlay relies on the kustomize [khelm plugin](https://github.com/mgoltzsche/khelm).
This is a Helm chart renderer, which generates a manifest output which you can then use overlays
via kustomize.

Detailed installation instructions can be found on the project page (link above). Here in short:

```bash
OS=$(uname | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m | sed 's/x86_64/amd64/; s/aarch64/arm64/')
mkdir -p $HOME/.config/kustomize/plugin/khelm.mgoltzsche.github.com/v2/chartrenderer
curl -fsSL https://github.com/mgoltzsche/khelm/releases/latest/download/khelm-${OS}-${ARCH} > $HOME/.config/kustomize/plugin/khelm.mgoltzsche.github.com/v2/chartrenderer/ChartRenderer
chmod +x $HOME/.config/kustomize/plugin/khelm.mgoltzsche.github.com/v2/chartrenderer/ChartRenderer
```

The `kustomization.yaml` specifies the `generator.yaml` as generator file. In there, we use the ChartRenderer.
You can specify a `values.yaml` in the `generator.yaml` to get applied during the chart rendering.

To deploy the overlay use this kind of command:

```
export KHELM_TRUST_ANY_REPO=true
kustomize build . --enable-alpha-plugins | kubectl apply -f -
```
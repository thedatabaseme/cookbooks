# CSI deployments
You can find the general CSI snapshotter deployment under the `base` directory. This will deploy
all needed components to use volume snapshots later (only needed when your CSI driver supports snapshots)

## CSI Synology driver

The `overlays/synology-csi` folder contains the synology-csi driver deployment (including snapshotter).
In order to get the configuration adjusted to your environment, you need to update the following files:

- `overlays/synology-csi/client-info.yml`: A secret will get generated from this file, including your Synology user credentials
- `overlays/synology-csi/storageclass.yaml`: You need to adjust the referenced DSM here (which you specified in the `client-info.yml`)

To apply the Synology CSI driver and the Kubernetes snapshot controller, issue the following command (needs kustomize to be installed):
```shell
kubectl apply -k overlays/synology-csi/
```

More information on the CSI Synology driver can be found [here](https://github.com/SynologyOpenSource/synology-csi).
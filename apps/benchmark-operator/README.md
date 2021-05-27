# Deploy benchmark-operator for cluster testing

The _benchmark-operator_ deployment files have been created from the checked-out [benchmark-operator](https://github.com/cloud-bulldozer/benchmark-operator) Helm repo as follows

````
src/benchmark-operator/charts/benchmark-operator  (master)$ helm template benchmark-operator \
    --output-dir ~/src/ocp4-gitops/apps/benchmark-operator/base/ \
    --namespace my-ripsaw --values values.yaml .
```

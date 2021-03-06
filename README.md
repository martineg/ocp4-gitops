# OCP4 configuration lab

Configure OCP4 with [declarative management strategy](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/declarative-config/) and GitOps.

The repository include configurations to be applied with [Kustomize](https://kustomize.io/) and [OpenShift GitOps](https://docs.openshift.com/container-platform/4.7/cicd/gitops/understanding-openshift-gitops.html) through ArgoCD.

Inspired by and using resources from the [GitOps Catalog](https://github.com/redhat-cop/gitops-catalog) and [GitOps Cluster Configuration](https://github.com/gnunn-gitops/cluster-config) repositories.

# Deployment

The lab cluster is bootstrapped as follows
```
until ( kustomize build clusters/lab | oc apply -f - ); do
    sleep 2;
done
```

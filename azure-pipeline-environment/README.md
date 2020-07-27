# Azure Pipeline Environment

Azure Pipeline Environment manages all required Kubernetes resources to provision an [Kubernetes environment](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/environments-kubernetes?view=azure-devops) in Azure Pipelines.

This uses the ["Using existing service account"](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/environments-kubernetes?view=azure-devops#using-existing-service-account) and should solely be used if the [automatic provisioning flow](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/environments-kubernetes?view=azure-devops#azure-kubernetes-service) does not work.

## TL;DR

```console
helm repo add coditeu https://coditeu.github.io/charts
helm install coditeu/azure-pipeline-environment
```

## Introduction

## Installing the Chart

To install the chart with the release name `azure-pipeline-environment`:

```console
$ helm install --name azure-pipeline-environment coditeu/azure-pipeline-environment
```

## Uninstalling the Chart

To uninstall the `azure-pipeline-environment` deployment:

```console
helm uninstall azure-pipeline-environment
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Configuration

The following table lists the configurable parameters of the Promitor chart and
their default values.

| Parameter                    | Description                         | Default                       |
|:-----------------------------|:------------------------------------|:------------------------------|
| `serviceAccount.name`        | Name of the service account to use  | `az-devops`                   |
| `serviceAccount.annotations` | Annotations for the service account | None                          |
| `roles.cluster.name`         | Name of the cluster role to create  |  `azure:devops:cluster-admin` |
| `bindings.cluster.name`      | Name of the cluster binding         | `az-devops-admin`             |
| `bindings.role.name`         | Name of the role binding            | `az-devops-admin`             |
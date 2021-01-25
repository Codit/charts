# Schedule Pod Restart

Automatically restarting pods with labels based on a cron schedule.

## TL;DR

```console
helm repo add coditeu https://coditeu.github.io/charts
helm repo update
helm install coditeu/cronjob-pod-restart
```

## Introduction

## Installing the Chart

To install the chart with the release name `schedule-pod-restart`:

```console
$ helm install schedule-pod-restart coditeu/schedule-pod-restart --set "cronjob.schedule=0 1 * * *" --set cronjob.podLabels=app=example
```

## Uninstalling the Chart

To uninstall the `schedule-pod-restart` deployment:

```console
helm uninstall schedule-pod-restart
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Configuration

The following table lists the configurable parameters of the chart and
their default values.

| Parameter                    | Description                                                              | Default                           |
|:-----------------------------|:-------------------------------------------------------------------------|:----------------------------------|
| `nameOverride`               | Name of the cronjob that will be created                                 | Chart Name `schedule-pod-restart` |
| `serviceAccount.name`        | Name of the service account to use                                       | `operations-pod-restart`          |
| `serviceAccount.annotations` | Annotations for the service account                                      | None                              |
| `role.name`                  | Name of the role to create                                               | `manage-pods-role`                |
| `bindings.role.name`         | Name of the role binding                                                 | `manage-pods-role-binding`        |
| `cronjob.schedule`           | A cronjob expression that defines the schedule when the job should run   | `0 0 * * *`                       |
| `cronjob.podLabels`           | One or more labels on the pods that need to be restarted. Use format `key1=value1,key2=value2`      | None   |
| `bitnamiContainerImageTag`   | bitnami/kubectl container image tag                                      | Version of the Kubernetes cluster where the chart will be deployed          |

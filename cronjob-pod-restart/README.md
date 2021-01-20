# Cronjob Pod Restart

A cronjob that executes a scheduled restart of pods by label.

## TL;DR

```console
helm repo add coditeu https://coditeu.github.io/charts
helm install coditeu/cronjob-pod-restart
```

## Introduction

## Installing the Chart

To install the chart with the release name `cronjob-pod-restart`:

```console
$ helm install cronjob-pod-restart coditeu/cronjob-pod-restart
```

## Uninstalling the Chart

To uninstall the `cronjob-pod-restart` deployment:

```console
helm uninstall cronjob-pod-restart
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Configuration

The following table lists the configurable parameters of the chart and
their default values.

| Parameter                    | Description                                                              | Default                       |
|:-----------------------------|:-------------------------------------------------------------------------|:------------------------------|
| `serviceAccount.name`        | Name of the service account to use                                       | `operations-pod-restart`      |
| `serviceAccount.annotations` | Annotations for the service account                                      | None                          |
| `roles.cluster.name`         | Name of the role to create                                               | `get-pods-role`               |
| `bindings.role.name`         | Name of the role binding                                                 | `get-pods-role-binding`       |
| `cronjob.name`               | Name of the cronjob that will be created                                 | `cronjob-delete-pods`         |
| `cronjob.schedule`           | A cronjob expression that defines the schedule when the job should run   | `0 0 * * *`                   |
| `cronjob.podLabel`           | The label of the pods that need to be restarted through the cronjob      | None                          |
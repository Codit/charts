# Contributing to Codits Helm Charts

Thanks for helping make them better!

## Shipping a new Helm chart version

You can easily release a new Helm chart version:

1. Update the version of the Helm chart in `Chart.yaml`

2. Package the Helm chart

```shell
$ helm package azure-pipeline-environment
Successfully packaged chart and saved it to: C:\Code\GitHub\charts-codit\azure-pipeline-environment-0.1.0-alpha.tgz
```

3. Move the new chart to the `docs` folder

```shell
$ mv azure-pipeline-environment-*.tgz docs
```

4. Re-index the Helm repo to add our new version

```shell
$ helm repo index docs --url https://coditeu.github.io/charts
```
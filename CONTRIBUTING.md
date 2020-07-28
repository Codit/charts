# Contributing to Codits Helm Charts

Thanks for helping make them better!

## Contributing new Helm charts

It's super easy to add a new Helm chart by running:

```shell
$ helm create example-chart
Creating example-chart
```

This will **scaffold a Helm chart** which you can start to use for building your own Helm chart. **All Helm charts must be located in the root of the GitHub repo and provide a CI** that will lint and install the Helm chart on a Kubernetes Kind cluster. ([example](https://github.com/CoditEU/charts/blob/contributing/build/ci-azure-pipeline-environment.yml))

In order to improve user experience, **every Helm chart must contain a README** explaining what it is, how to install it and how it can be configured to meet customer needs. This will be used by tools such as Helm CLI, [Artifact Hub](https://artifacthub.io/), [Helm Hub](https://hub.helm.sh/), and others to get people started or learn what your chart does.

Last but not least, **every Helm chart should be listed in the README** of GitHub repo.

Once the Helm chart is ready to be released, you can follow [these instructions](#shipping-a-new-helm-chart-version) to release it.

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

5. Create a pull request with our new Helm index
6. Create a GitHub release for your new Helm chart version by using the following template

> *Chart: {{Chart Version}} | App: {{App Name}}*
> {{Description about the Helm chart}}
> 
> ## TL;DR
> ```shell
> helm repo add coditeu https://coditeu.github.io/charts
> helm install {{Chart Name}}
> ```
> 
> ## What is new?
> ### Features
> 
> - {{List new features}}
> 
> ### Fixes / Changes
> 
> - {{List fixes}}
> 
> ### Breaking Changes
> 
> - {{List breaking changes}}
> 
> ### Removal
> 
> - {{List removed features}}
```
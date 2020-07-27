# Helm Charts
Helm chart repo of common apps that we use.

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

## License Information
This is licensed under The MIT License (MIT). Which means that you can use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the web application. But you always need to state that Codit is the original author of this web application.

Read the full license [here](https://github.com/CoditEU/charts/blob/master/LICENSE).
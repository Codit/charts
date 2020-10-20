# Helm Charts
Helm chart repo of common apps that we use:

- **Azure Pipeline Environment** - A Helm chart for creating required resources to use Azure Pipelines' Environment

![Codit logo](./media/logo.png)

## Getting Started
### Adding our Helm chart repo

```console
$ helm repo add coditeu https://coditeu.github.io/charts
"coditeu" has been added to your repositories
```

### Browse all our Helm charts
```
$ helm search repo coditeu/ --devel
NAME                                    CHART VERSION   APP VERSION     DESCRIPTION
coditeu/azure-pipeline-environment      1.0.0                           A Helm chart for creating required resources to...
```

## Releases

You can find the latest releases [here](https://github.com/coditeu/charts/releases).

## Contributing

You can find contributing guide [here](./CONTRIBUTING.md).

## License Information
This is licensed under The MIT License (MIT). Which means that you can use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the web application. But you always need to state that Codit is the original author of this web application.

Read the full license [here](https://github.com/CoditEU/charts/blob/master/LICENSE).

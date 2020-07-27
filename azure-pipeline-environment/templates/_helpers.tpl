{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "azure-pipeline-environment.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "azure-pipeline-environment.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "azure-pipeline-environment.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "azure-pipeline-environment.labels" -}}
helm.sh/chart: {{ include "azure-pipeline-environment.chart" . }}
{{ include "azure-pipeline-environment.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "azure-pipeline-environment.selectorLabels" -}}
app.kubernetes.io/name: {{ include "azure-pipeline-environment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "azure-pipeline-environment.serviceAccountName" -}}
{{- default (include "azure-pipeline-environment.fullname" .) .Values.serviceAccount.name }}
{{- end }}

{{/*
Create the name of the cluster role to use
*/}}
{{- define "azure-pipeline-environment.clusterRole" -}}
{{- default (include "azure-pipeline-environment.fullname" .) .Values.roles.cluster.name }}
{{- end }}

{{/*
Create the name of the cluster role binding to use
*/}}
{{- define "azure-pipeline-environment.clusterRoleBinding" -}}
{{- default (include "azure-pipeline-environment.fullname" .) .Values.bindings.cluster.name }}
{{- end }}

{{/*
Create the name of the role binding to use
*/}}
{{- define "azure-pipeline-environment.roleBinding" -}}
{{- default (include "azure-pipeline-environment.fullname" .) .Values.bindings.role.name }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "cronjob-pod-restart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cronjob-pod-restart.fullname" -}}
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
{{- define "cronjob-pod-restart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "cronjob-pod-restart.labels" -}}
helm.sh/chart: {{ include "cronjob-pod-restart.chart" . }}
{{ include "cronjob-pod-restart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "cronjob-pod-restart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cronjob-pod-restart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "cronjob-pod-restart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "cronjob-pod-restart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the cluster role to use
*/}}
{{- define "cronjob-pod-restart.clusterRole" -}}
{{- default (include "cronjob-pod-restart.fullname" .) .Values.roles.cluster.name }}
{{- end }}

{{/*
Create the name of the role binding to use
*/}}
{{- define "cronjob-pod-restart.roleBinding" -}}
{{- default (include "cronjob-pod-restart.fullname" .) .Values.bindings.role.name }}
{{- end }}
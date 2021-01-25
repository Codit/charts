{{/*
Expand the name of the chart.
*/}}
{{- define "schedule-pod-restart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "schedule-pod-restart.fullname" -}}
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
{{- define "schedule-pod-restart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "schedule-pod-restart.labels" -}}
helm.sh/chart: {{ include "schedule-pod-restart.chart" . }}
{{ include "schedule-pod-restart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "schedule-pod-restart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "schedule-pod-restart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "schedule-pod-restart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "schedule-pod-restart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the cluster role to use
*/}}
{{- define "schedule-pod-restart.role" -}}
{{- default (include "schedule-pod-restart.fullname" .) .Values.role.name }}
{{- end }}

{{/*
Create the name of the role binding to use
*/}}
{{- define "schedule-pod-restart.roleBinding" -}}
{{- default (include "schedule-pod-restart.fullname" .) .Values.bindings.role.name }}
{{- end }}

{{/*
Gets the target kubernetes version which is used for the bitnami/kubectl container image tag
*/}}
{{- define "schedule-pod-restart.kubeVersion" -}}
{{- .Capabilities.KubeVersion.Version | replace "v" "" }}
{{- end }}

{{/*
Defines the target kubernetes version which is used for the bitnami/kubectl container image tag
*/}}
{{- define "schedule-pod-restart.imageTag" -}}
{{- default (include "schedule-pod-restart.kubeVersion" .) .Values.image.tagname }}
{{- end }}

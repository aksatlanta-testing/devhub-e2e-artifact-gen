{{/*
Expand the name of the chart.
*/}}
{{- define "go-echoafec2926-4bde-4a03-907e-5a58e9a98238.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "go-echoafec2926-4bde-4a03-907e-5a58e9a98238.fullname" -}}
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
{{- define "go-echoafec2926-4bde-4a03-907e-5a58e9a98238.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "go-echoafec2926-4bde-4a03-907e-5a58e9a98238.labels" -}}
helm.sh/chart: {{ include "go-echoafec2926-4bde-4a03-907e-5a58e9a98238.chart" . }}
{{ include "go-echoafec2926-4bde-4a03-907e-5a58e9a98238.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "go-echoafec2926-4bde-4a03-907e-5a58e9a98238.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafec2926-4bde-4a03-907e-5a58e9a98238.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoa2a48790-9c5d-4692-9f18-12c3d3fbe8cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2a48790-9c5d-4692-9f18-12c3d3fbe8cf.fullname" -}}
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


{{- define "go-echoa2a48790-9c5d-4692-9f18-12c3d3fbe8cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa2a48790-9c5d-4692-9f18-12c3d3fbe8cf.labels" -}}
helm.sh/chart: {{ include "go-echoa2a48790-9c5d-4692-9f18-12c3d3fbe8cf.chart" . }}
{{ include "go-echoa2a48790-9c5d-4692-9f18-12c3d3fbe8cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa2a48790-9c5d-4692-9f18-12c3d3fbe8cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa2a48790-9c5d-4692-9f18-12c3d3fbe8cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
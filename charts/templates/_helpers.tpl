
{{- define "go-echo3689c624-0eef-42b8-80d0-375375dfe5ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3689c624-0eef-42b8-80d0-375375dfe5ad.fullname" -}}
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


{{- define "go-echo3689c624-0eef-42b8-80d0-375375dfe5ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3689c624-0eef-42b8-80d0-375375dfe5ad.labels" -}}
helm.sh/chart: {{ include "go-echo3689c624-0eef-42b8-80d0-375375dfe5ad.chart" . }}
{{ include "go-echo3689c624-0eef-42b8-80d0-375375dfe5ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3689c624-0eef-42b8-80d0-375375dfe5ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3689c624-0eef-42b8-80d0-375375dfe5ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
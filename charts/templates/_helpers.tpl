
{{- define "go-echob38099f1-9f50-44e3-9f74-7a64bd2d79da.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob38099f1-9f50-44e3-9f74-7a64bd2d79da.fullname" -}}
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


{{- define "go-echob38099f1-9f50-44e3-9f74-7a64bd2d79da.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob38099f1-9f50-44e3-9f74-7a64bd2d79da.labels" -}}
helm.sh/chart: {{ include "go-echob38099f1-9f50-44e3-9f74-7a64bd2d79da.chart" . }}
{{ include "go-echob38099f1-9f50-44e3-9f74-7a64bd2d79da.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob38099f1-9f50-44e3-9f74-7a64bd2d79da.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob38099f1-9f50-44e3-9f74-7a64bd2d79da.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo4eee1aa0-eda0-44e6-92dc-4b74ddb8d366.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4eee1aa0-eda0-44e6-92dc-4b74ddb8d366.fullname" -}}
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


{{- define "go-echo4eee1aa0-eda0-44e6-92dc-4b74ddb8d366.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4eee1aa0-eda0-44e6-92dc-4b74ddb8d366.labels" -}}
helm.sh/chart: {{ include "go-echo4eee1aa0-eda0-44e6-92dc-4b74ddb8d366.chart" . }}
{{ include "go-echo4eee1aa0-eda0-44e6-92dc-4b74ddb8d366.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4eee1aa0-eda0-44e6-92dc-4b74ddb8d366.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4eee1aa0-eda0-44e6-92dc-4b74ddb8d366.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
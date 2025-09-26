
{{- define "go-echod7f5d73c-f0cb-4e4c-9b43-bf6a0fc21c04.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7f5d73c-f0cb-4e4c-9b43-bf6a0fc21c04.fullname" -}}
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


{{- define "go-echod7f5d73c-f0cb-4e4c-9b43-bf6a0fc21c04.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7f5d73c-f0cb-4e4c-9b43-bf6a0fc21c04.labels" -}}
helm.sh/chart: {{ include "go-echod7f5d73c-f0cb-4e4c-9b43-bf6a0fc21c04.chart" . }}
{{ include "go-echod7f5d73c-f0cb-4e4c-9b43-bf6a0fc21c04.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7f5d73c-f0cb-4e4c-9b43-bf6a0fc21c04.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7f5d73c-f0cb-4e4c-9b43-bf6a0fc21c04.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
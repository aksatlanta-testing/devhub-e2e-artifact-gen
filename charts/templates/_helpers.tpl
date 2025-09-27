
{{- define "go-echoc01e20fe-5701-474f-858a-17aaf5db941f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc01e20fe-5701-474f-858a-17aaf5db941f.fullname" -}}
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


{{- define "go-echoc01e20fe-5701-474f-858a-17aaf5db941f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc01e20fe-5701-474f-858a-17aaf5db941f.labels" -}}
helm.sh/chart: {{ include "go-echoc01e20fe-5701-474f-858a-17aaf5db941f.chart" . }}
{{ include "go-echoc01e20fe-5701-474f-858a-17aaf5db941f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc01e20fe-5701-474f-858a-17aaf5db941f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc01e20fe-5701-474f-858a-17aaf5db941f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
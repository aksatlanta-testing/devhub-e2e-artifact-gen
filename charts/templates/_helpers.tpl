
{{- define "go-echo711b1d20-3e18-4ed6-ad40-78e58e534a94.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo711b1d20-3e18-4ed6-ad40-78e58e534a94.fullname" -}}
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


{{- define "go-echo711b1d20-3e18-4ed6-ad40-78e58e534a94.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo711b1d20-3e18-4ed6-ad40-78e58e534a94.labels" -}}
helm.sh/chart: {{ include "go-echo711b1d20-3e18-4ed6-ad40-78e58e534a94.chart" . }}
{{ include "go-echo711b1d20-3e18-4ed6-ad40-78e58e534a94.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo711b1d20-3e18-4ed6-ad40-78e58e534a94.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo711b1d20-3e18-4ed6-ad40-78e58e534a94.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
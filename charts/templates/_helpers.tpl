
{{- define "go-echoff2706a5-9d97-4c02-adb7-bfc34742d7cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff2706a5-9d97-4c02-adb7-bfc34742d7cb.fullname" -}}
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


{{- define "go-echoff2706a5-9d97-4c02-adb7-bfc34742d7cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff2706a5-9d97-4c02-adb7-bfc34742d7cb.labels" -}}
helm.sh/chart: {{ include "go-echoff2706a5-9d97-4c02-adb7-bfc34742d7cb.chart" . }}
{{ include "go-echoff2706a5-9d97-4c02-adb7-bfc34742d7cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff2706a5-9d97-4c02-adb7-bfc34742d7cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff2706a5-9d97-4c02-adb7-bfc34742d7cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
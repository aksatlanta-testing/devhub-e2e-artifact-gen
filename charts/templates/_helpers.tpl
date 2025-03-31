
{{- define "go-echoe51bad02-7937-4d9c-9805-1fdcc936c471.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe51bad02-7937-4d9c-9805-1fdcc936c471.fullname" -}}
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


{{- define "go-echoe51bad02-7937-4d9c-9805-1fdcc936c471.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe51bad02-7937-4d9c-9805-1fdcc936c471.labels" -}}
helm.sh/chart: {{ include "go-echoe51bad02-7937-4d9c-9805-1fdcc936c471.chart" . }}
{{ include "go-echoe51bad02-7937-4d9c-9805-1fdcc936c471.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe51bad02-7937-4d9c-9805-1fdcc936c471.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe51bad02-7937-4d9c-9805-1fdcc936c471.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
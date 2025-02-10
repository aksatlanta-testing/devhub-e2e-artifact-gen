
{{- define "go-echoc228ad02-8afa-4381-a569-944e5e2749ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc228ad02-8afa-4381-a569-944e5e2749ca.fullname" -}}
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


{{- define "go-echoc228ad02-8afa-4381-a569-944e5e2749ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc228ad02-8afa-4381-a569-944e5e2749ca.labels" -}}
helm.sh/chart: {{ include "go-echoc228ad02-8afa-4381-a569-944e5e2749ca.chart" . }}
{{ include "go-echoc228ad02-8afa-4381-a569-944e5e2749ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc228ad02-8afa-4381-a569-944e5e2749ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc228ad02-8afa-4381-a569-944e5e2749ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
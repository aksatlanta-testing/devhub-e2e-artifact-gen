
{{- define "go-echoa4522572-eaf6-45ae-99fd-9cf709770198.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4522572-eaf6-45ae-99fd-9cf709770198.fullname" -}}
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


{{- define "go-echoa4522572-eaf6-45ae-99fd-9cf709770198.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4522572-eaf6-45ae-99fd-9cf709770198.labels" -}}
helm.sh/chart: {{ include "go-echoa4522572-eaf6-45ae-99fd-9cf709770198.chart" . }}
{{ include "go-echoa4522572-eaf6-45ae-99fd-9cf709770198.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4522572-eaf6-45ae-99fd-9cf709770198.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4522572-eaf6-45ae-99fd-9cf709770198.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
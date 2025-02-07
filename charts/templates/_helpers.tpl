
{{- define "go-echoa65aa41b-d4e5-4ec6-997d-15d5685c2121.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa65aa41b-d4e5-4ec6-997d-15d5685c2121.fullname" -}}
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


{{- define "go-echoa65aa41b-d4e5-4ec6-997d-15d5685c2121.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa65aa41b-d4e5-4ec6-997d-15d5685c2121.labels" -}}
helm.sh/chart: {{ include "go-echoa65aa41b-d4e5-4ec6-997d-15d5685c2121.chart" . }}
{{ include "go-echoa65aa41b-d4e5-4ec6-997d-15d5685c2121.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa65aa41b-d4e5-4ec6-997d-15d5685c2121.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa65aa41b-d4e5-4ec6-997d-15d5685c2121.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
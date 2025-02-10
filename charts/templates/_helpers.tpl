
{{- define "go-echoa065a9d2-6a4d-4c58-be63-e1f65696573e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa065a9d2-6a4d-4c58-be63-e1f65696573e.fullname" -}}
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


{{- define "go-echoa065a9d2-6a4d-4c58-be63-e1f65696573e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa065a9d2-6a4d-4c58-be63-e1f65696573e.labels" -}}
helm.sh/chart: {{ include "go-echoa065a9d2-6a4d-4c58-be63-e1f65696573e.chart" . }}
{{ include "go-echoa065a9d2-6a4d-4c58-be63-e1f65696573e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa065a9d2-6a4d-4c58-be63-e1f65696573e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa065a9d2-6a4d-4c58-be63-e1f65696573e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echof88e0a84-adf2-4ebb-9f4c-7a1b046dd984.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof88e0a84-adf2-4ebb-9f4c-7a1b046dd984.fullname" -}}
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


{{- define "go-echof88e0a84-adf2-4ebb-9f4c-7a1b046dd984.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof88e0a84-adf2-4ebb-9f4c-7a1b046dd984.labels" -}}
helm.sh/chart: {{ include "go-echof88e0a84-adf2-4ebb-9f4c-7a1b046dd984.chart" . }}
{{ include "go-echof88e0a84-adf2-4ebb-9f4c-7a1b046dd984.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof88e0a84-adf2-4ebb-9f4c-7a1b046dd984.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof88e0a84-adf2-4ebb-9f4c-7a1b046dd984.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
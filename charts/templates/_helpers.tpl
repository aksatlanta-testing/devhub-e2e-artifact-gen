
{{- define "go-echof814b846-4b63-4b10-bb01-da3a0aae888e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof814b846-4b63-4b10-bb01-da3a0aae888e.fullname" -}}
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


{{- define "go-echof814b846-4b63-4b10-bb01-da3a0aae888e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof814b846-4b63-4b10-bb01-da3a0aae888e.labels" -}}
helm.sh/chart: {{ include "go-echof814b846-4b63-4b10-bb01-da3a0aae888e.chart" . }}
{{ include "go-echof814b846-4b63-4b10-bb01-da3a0aae888e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof814b846-4b63-4b10-bb01-da3a0aae888e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof814b846-4b63-4b10-bb01-da3a0aae888e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
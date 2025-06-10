
{{- define "go-echof635c437-dd23-4a83-9d55-c783a2a2e728.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof635c437-dd23-4a83-9d55-c783a2a2e728.fullname" -}}
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


{{- define "go-echof635c437-dd23-4a83-9d55-c783a2a2e728.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof635c437-dd23-4a83-9d55-c783a2a2e728.labels" -}}
helm.sh/chart: {{ include "go-echof635c437-dd23-4a83-9d55-c783a2a2e728.chart" . }}
{{ include "go-echof635c437-dd23-4a83-9d55-c783a2a2e728.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof635c437-dd23-4a83-9d55-c783a2a2e728.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof635c437-dd23-4a83-9d55-c783a2a2e728.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
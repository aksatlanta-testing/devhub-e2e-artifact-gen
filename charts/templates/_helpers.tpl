
{{- define "go-echod3ed54a4-fcbf-4707-bdc4-0a4b08a48a78.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3ed54a4-fcbf-4707-bdc4-0a4b08a48a78.fullname" -}}
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


{{- define "go-echod3ed54a4-fcbf-4707-bdc4-0a4b08a48a78.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3ed54a4-fcbf-4707-bdc4-0a4b08a48a78.labels" -}}
helm.sh/chart: {{ include "go-echod3ed54a4-fcbf-4707-bdc4-0a4b08a48a78.chart" . }}
{{ include "go-echod3ed54a4-fcbf-4707-bdc4-0a4b08a48a78.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod3ed54a4-fcbf-4707-bdc4-0a4b08a48a78.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod3ed54a4-fcbf-4707-bdc4-0a4b08a48a78.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
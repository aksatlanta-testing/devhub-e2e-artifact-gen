
{{- define "go-echof5598cce-cd22-4187-a8be-1a6a18fad651.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5598cce-cd22-4187-a8be-1a6a18fad651.fullname" -}}
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


{{- define "go-echof5598cce-cd22-4187-a8be-1a6a18fad651.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5598cce-cd22-4187-a8be-1a6a18fad651.labels" -}}
helm.sh/chart: {{ include "go-echof5598cce-cd22-4187-a8be-1a6a18fad651.chart" . }}
{{ include "go-echof5598cce-cd22-4187-a8be-1a6a18fad651.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof5598cce-cd22-4187-a8be-1a6a18fad651.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof5598cce-cd22-4187-a8be-1a6a18fad651.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
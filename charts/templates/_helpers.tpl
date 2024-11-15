
{{- define "go-echo3bb9ee7f-c9a7-4ecf-bfba-085b373d68fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3bb9ee7f-c9a7-4ecf-bfba-085b373d68fe.fullname" -}}
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


{{- define "go-echo3bb9ee7f-c9a7-4ecf-bfba-085b373d68fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3bb9ee7f-c9a7-4ecf-bfba-085b373d68fe.labels" -}}
helm.sh/chart: {{ include "go-echo3bb9ee7f-c9a7-4ecf-bfba-085b373d68fe.chart" . }}
{{ include "go-echo3bb9ee7f-c9a7-4ecf-bfba-085b373d68fe.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3bb9ee7f-c9a7-4ecf-bfba-085b373d68fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3bb9ee7f-c9a7-4ecf-bfba-085b373d68fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
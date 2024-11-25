
{{- define "go-echocf9582fa-dc1a-4e40-8bb2-4ecda6f5b918.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf9582fa-dc1a-4e40-8bb2-4ecda6f5b918.fullname" -}}
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


{{- define "go-echocf9582fa-dc1a-4e40-8bb2-4ecda6f5b918.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf9582fa-dc1a-4e40-8bb2-4ecda6f5b918.labels" -}}
helm.sh/chart: {{ include "go-echocf9582fa-dc1a-4e40-8bb2-4ecda6f5b918.chart" . }}
{{ include "go-echocf9582fa-dc1a-4e40-8bb2-4ecda6f5b918.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf9582fa-dc1a-4e40-8bb2-4ecda6f5b918.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf9582fa-dc1a-4e40-8bb2-4ecda6f5b918.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
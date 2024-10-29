
{{- define "go-echod2d1c3e7-ae83-4de7-8a32-37d1c0479d81.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2d1c3e7-ae83-4de7-8a32-37d1c0479d81.fullname" -}}
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


{{- define "go-echod2d1c3e7-ae83-4de7-8a32-37d1c0479d81.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2d1c3e7-ae83-4de7-8a32-37d1c0479d81.labels" -}}
helm.sh/chart: {{ include "go-echod2d1c3e7-ae83-4de7-8a32-37d1c0479d81.chart" . }}
{{ include "go-echod2d1c3e7-ae83-4de7-8a32-37d1c0479d81.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2d1c3e7-ae83-4de7-8a32-37d1c0479d81.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2d1c3e7-ae83-4de7-8a32-37d1c0479d81.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
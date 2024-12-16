
{{- define "go-echobe436aec-4b56-4762-b7d7-721a200beacf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe436aec-4b56-4762-b7d7-721a200beacf.fullname" -}}
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


{{- define "go-echobe436aec-4b56-4762-b7d7-721a200beacf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe436aec-4b56-4762-b7d7-721a200beacf.labels" -}}
helm.sh/chart: {{ include "go-echobe436aec-4b56-4762-b7d7-721a200beacf.chart" . }}
{{ include "go-echobe436aec-4b56-4762-b7d7-721a200beacf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe436aec-4b56-4762-b7d7-721a200beacf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe436aec-4b56-4762-b7d7-721a200beacf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
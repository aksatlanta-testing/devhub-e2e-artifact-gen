
{{- define "go-echo53015c63-7a6d-4090-93c0-ca23a06994ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53015c63-7a6d-4090-93c0-ca23a06994ff.fullname" -}}
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


{{- define "go-echo53015c63-7a6d-4090-93c0-ca23a06994ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53015c63-7a6d-4090-93c0-ca23a06994ff.labels" -}}
helm.sh/chart: {{ include "go-echo53015c63-7a6d-4090-93c0-ca23a06994ff.chart" . }}
{{ include "go-echo53015c63-7a6d-4090-93c0-ca23a06994ff.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo53015c63-7a6d-4090-93c0-ca23a06994ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo53015c63-7a6d-4090-93c0-ca23a06994ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
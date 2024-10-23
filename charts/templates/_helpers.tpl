
{{- define "go-echo7c5da53a-6dc6-46d8-a05b-78419c19d24b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c5da53a-6dc6-46d8-a05b-78419c19d24b.fullname" -}}
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


{{- define "go-echo7c5da53a-6dc6-46d8-a05b-78419c19d24b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7c5da53a-6dc6-46d8-a05b-78419c19d24b.labels" -}}
helm.sh/chart: {{ include "go-echo7c5da53a-6dc6-46d8-a05b-78419c19d24b.chart" . }}
{{ include "go-echo7c5da53a-6dc6-46d8-a05b-78419c19d24b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7c5da53a-6dc6-46d8-a05b-78419c19d24b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7c5da53a-6dc6-46d8-a05b-78419c19d24b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
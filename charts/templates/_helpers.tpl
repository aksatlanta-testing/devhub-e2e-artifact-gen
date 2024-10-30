
{{- define "go-echo082a6f7d-b6d6-49ec-83c5-7aed3b9fd55d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo082a6f7d-b6d6-49ec-83c5-7aed3b9fd55d.fullname" -}}
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


{{- define "go-echo082a6f7d-b6d6-49ec-83c5-7aed3b9fd55d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo082a6f7d-b6d6-49ec-83c5-7aed3b9fd55d.labels" -}}
helm.sh/chart: {{ include "go-echo082a6f7d-b6d6-49ec-83c5-7aed3b9fd55d.chart" . }}
{{ include "go-echo082a6f7d-b6d6-49ec-83c5-7aed3b9fd55d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo082a6f7d-b6d6-49ec-83c5-7aed3b9fd55d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo082a6f7d-b6d6-49ec-83c5-7aed3b9fd55d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
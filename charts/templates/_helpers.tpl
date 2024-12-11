
{{- define "go-echo420dc108-e0ad-498b-8460-129f9ce71d4e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo420dc108-e0ad-498b-8460-129f9ce71d4e.fullname" -}}
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


{{- define "go-echo420dc108-e0ad-498b-8460-129f9ce71d4e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo420dc108-e0ad-498b-8460-129f9ce71d4e.labels" -}}
helm.sh/chart: {{ include "go-echo420dc108-e0ad-498b-8460-129f9ce71d4e.chart" . }}
{{ include "go-echo420dc108-e0ad-498b-8460-129f9ce71d4e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo420dc108-e0ad-498b-8460-129f9ce71d4e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo420dc108-e0ad-498b-8460-129f9ce71d4e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
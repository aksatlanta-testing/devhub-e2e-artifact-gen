
{{- define "go-echoa6f07749-e213-477f-9d9c-76899e3f1869.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa6f07749-e213-477f-9d9c-76899e3f1869.fullname" -}}
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


{{- define "go-echoa6f07749-e213-477f-9d9c-76899e3f1869.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa6f07749-e213-477f-9d9c-76899e3f1869.labels" -}}
helm.sh/chart: {{ include "go-echoa6f07749-e213-477f-9d9c-76899e3f1869.chart" . }}
{{ include "go-echoa6f07749-e213-477f-9d9c-76899e3f1869.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa6f07749-e213-477f-9d9c-76899e3f1869.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa6f07749-e213-477f-9d9c-76899e3f1869.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
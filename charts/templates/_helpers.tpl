
{{- define "go-echobf6e640a-d243-44b6-a8b8-d64756bef5cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf6e640a-d243-44b6-a8b8-d64756bef5cb.fullname" -}}
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


{{- define "go-echobf6e640a-d243-44b6-a8b8-d64756bef5cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf6e640a-d243-44b6-a8b8-d64756bef5cb.labels" -}}
helm.sh/chart: {{ include "go-echobf6e640a-d243-44b6-a8b8-d64756bef5cb.chart" . }}
{{ include "go-echobf6e640a-d243-44b6-a8b8-d64756bef5cb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf6e640a-d243-44b6-a8b8-d64756bef5cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf6e640a-d243-44b6-a8b8-d64756bef5cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
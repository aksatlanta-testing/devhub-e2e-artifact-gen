
{{- define "go-echof4fc5242-315c-479c-b4ac-8f73fe87798d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4fc5242-315c-479c-b4ac-8f73fe87798d.fullname" -}}
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


{{- define "go-echof4fc5242-315c-479c-b4ac-8f73fe87798d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof4fc5242-315c-479c-b4ac-8f73fe87798d.labels" -}}
helm.sh/chart: {{ include "go-echof4fc5242-315c-479c-b4ac-8f73fe87798d.chart" . }}
{{ include "go-echof4fc5242-315c-479c-b4ac-8f73fe87798d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof4fc5242-315c-479c-b4ac-8f73fe87798d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof4fc5242-315c-479c-b4ac-8f73fe87798d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
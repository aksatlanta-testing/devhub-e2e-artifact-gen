
{{- define "go-echob4499324-e232-4719-8c7d-955e248cf8b4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4499324-e232-4719-8c7d-955e248cf8b4.fullname" -}}
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


{{- define "go-echob4499324-e232-4719-8c7d-955e248cf8b4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4499324-e232-4719-8c7d-955e248cf8b4.labels" -}}
helm.sh/chart: {{ include "go-echob4499324-e232-4719-8c7d-955e248cf8b4.chart" . }}
{{ include "go-echob4499324-e232-4719-8c7d-955e248cf8b4.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob4499324-e232-4719-8c7d-955e248cf8b4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob4499324-e232-4719-8c7d-955e248cf8b4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
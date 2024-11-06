
{{- define "go-echo71390a14-30e6-456c-b749-56bd09230e10.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71390a14-30e6-456c-b749-56bd09230e10.fullname" -}}
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


{{- define "go-echo71390a14-30e6-456c-b749-56bd09230e10.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71390a14-30e6-456c-b749-56bd09230e10.labels" -}}
helm.sh/chart: {{ include "go-echo71390a14-30e6-456c-b749-56bd09230e10.chart" . }}
{{ include "go-echo71390a14-30e6-456c-b749-56bd09230e10.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo71390a14-30e6-456c-b749-56bd09230e10.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo71390a14-30e6-456c-b749-56bd09230e10.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
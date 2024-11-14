
{{- define "go-echobcada585-e7f3-4efa-9ca3-53dbeac616cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcada585-e7f3-4efa-9ca3-53dbeac616cf.fullname" -}}
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


{{- define "go-echobcada585-e7f3-4efa-9ca3-53dbeac616cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcada585-e7f3-4efa-9ca3-53dbeac616cf.labels" -}}
helm.sh/chart: {{ include "go-echobcada585-e7f3-4efa-9ca3-53dbeac616cf.chart" . }}
{{ include "go-echobcada585-e7f3-4efa-9ca3-53dbeac616cf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobcada585-e7f3-4efa-9ca3-53dbeac616cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobcada585-e7f3-4efa-9ca3-53dbeac616cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
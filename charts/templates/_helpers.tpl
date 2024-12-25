
{{- define "go-echo17f258d7-9b13-4eff-9424-417ba88bc3fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo17f258d7-9b13-4eff-9424-417ba88bc3fc.fullname" -}}
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


{{- define "go-echo17f258d7-9b13-4eff-9424-417ba88bc3fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo17f258d7-9b13-4eff-9424-417ba88bc3fc.labels" -}}
helm.sh/chart: {{ include "go-echo17f258d7-9b13-4eff-9424-417ba88bc3fc.chart" . }}
{{ include "go-echo17f258d7-9b13-4eff-9424-417ba88bc3fc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo17f258d7-9b13-4eff-9424-417ba88bc3fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo17f258d7-9b13-4eff-9424-417ba88bc3fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoe2e0d1ea-f637-4d60-995f-0aae341043dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2e0d1ea-f637-4d60-995f-0aae341043dc.fullname" -}}
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


{{- define "go-echoe2e0d1ea-f637-4d60-995f-0aae341043dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2e0d1ea-f637-4d60-995f-0aae341043dc.labels" -}}
helm.sh/chart: {{ include "go-echoe2e0d1ea-f637-4d60-995f-0aae341043dc.chart" . }}
{{ include "go-echoe2e0d1ea-f637-4d60-995f-0aae341043dc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe2e0d1ea-f637-4d60-995f-0aae341043dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe2e0d1ea-f637-4d60-995f-0aae341043dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
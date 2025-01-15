
{{- define "go-echo5dfbd1e1-8400-430d-bd2e-7ede9721a843.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5dfbd1e1-8400-430d-bd2e-7ede9721a843.fullname" -}}
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


{{- define "go-echo5dfbd1e1-8400-430d-bd2e-7ede9721a843.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5dfbd1e1-8400-430d-bd2e-7ede9721a843.labels" -}}
helm.sh/chart: {{ include "go-echo5dfbd1e1-8400-430d-bd2e-7ede9721a843.chart" . }}
{{ include "go-echo5dfbd1e1-8400-430d-bd2e-7ede9721a843.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5dfbd1e1-8400-430d-bd2e-7ede9721a843.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5dfbd1e1-8400-430d-bd2e-7ede9721a843.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
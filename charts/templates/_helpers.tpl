
{{- define "go-echo509b5778-3ac3-4d4c-ab18-c0338f663ddb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo509b5778-3ac3-4d4c-ab18-c0338f663ddb.fullname" -}}
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


{{- define "go-echo509b5778-3ac3-4d4c-ab18-c0338f663ddb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo509b5778-3ac3-4d4c-ab18-c0338f663ddb.labels" -}}
helm.sh/chart: {{ include "go-echo509b5778-3ac3-4d4c-ab18-c0338f663ddb.chart" . }}
{{ include "go-echo509b5778-3ac3-4d4c-ab18-c0338f663ddb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo509b5778-3ac3-4d4c-ab18-c0338f663ddb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo509b5778-3ac3-4d4c-ab18-c0338f663ddb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
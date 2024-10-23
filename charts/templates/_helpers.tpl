
{{- define "go-echo655e981a-1cd5-4eae-b331-821a4561673c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo655e981a-1cd5-4eae-b331-821a4561673c.fullname" -}}
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


{{- define "go-echo655e981a-1cd5-4eae-b331-821a4561673c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo655e981a-1cd5-4eae-b331-821a4561673c.labels" -}}
helm.sh/chart: {{ include "go-echo655e981a-1cd5-4eae-b331-821a4561673c.chart" . }}
{{ include "go-echo655e981a-1cd5-4eae-b331-821a4561673c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo655e981a-1cd5-4eae-b331-821a4561673c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo655e981a-1cd5-4eae-b331-821a4561673c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
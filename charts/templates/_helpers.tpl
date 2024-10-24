
{{- define "go-echo7fab0a35-0a5b-4a01-85d1-b8cfd3a2e71f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fab0a35-0a5b-4a01-85d1-b8cfd3a2e71f.fullname" -}}
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


{{- define "go-echo7fab0a35-0a5b-4a01-85d1-b8cfd3a2e71f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7fab0a35-0a5b-4a01-85d1-b8cfd3a2e71f.labels" -}}
helm.sh/chart: {{ include "go-echo7fab0a35-0a5b-4a01-85d1-b8cfd3a2e71f.chart" . }}
{{ include "go-echo7fab0a35-0a5b-4a01-85d1-b8cfd3a2e71f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7fab0a35-0a5b-4a01-85d1-b8cfd3a2e71f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7fab0a35-0a5b-4a01-85d1-b8cfd3a2e71f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
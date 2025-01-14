
{{- define "go-echo4bfa3a4e-f42e-43a4-958a-f461e24952ae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bfa3a4e-f42e-43a4-958a-f461e24952ae.fullname" -}}
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


{{- define "go-echo4bfa3a4e-f42e-43a4-958a-f461e24952ae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4bfa3a4e-f42e-43a4-958a-f461e24952ae.labels" -}}
helm.sh/chart: {{ include "go-echo4bfa3a4e-f42e-43a4-958a-f461e24952ae.chart" . }}
{{ include "go-echo4bfa3a4e-f42e-43a4-958a-f461e24952ae.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4bfa3a4e-f42e-43a4-958a-f461e24952ae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4bfa3a4e-f42e-43a4-958a-f461e24952ae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
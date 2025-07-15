
{{- define "go-echoad96b221-4468-495b-80f6-f5e7f094d94b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad96b221-4468-495b-80f6-f5e7f094d94b.fullname" -}}
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


{{- define "go-echoad96b221-4468-495b-80f6-f5e7f094d94b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad96b221-4468-495b-80f6-f5e7f094d94b.labels" -}}
helm.sh/chart: {{ include "go-echoad96b221-4468-495b-80f6-f5e7f094d94b.chart" . }}
{{ include "go-echoad96b221-4468-495b-80f6-f5e7f094d94b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoad96b221-4468-495b-80f6-f5e7f094d94b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoad96b221-4468-495b-80f6-f5e7f094d94b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
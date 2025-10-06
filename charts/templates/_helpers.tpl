
{{- define "go-echo741042a6-8691-4a12-9fe2-58bb5fcd2620.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo741042a6-8691-4a12-9fe2-58bb5fcd2620.fullname" -}}
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


{{- define "go-echo741042a6-8691-4a12-9fe2-58bb5fcd2620.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo741042a6-8691-4a12-9fe2-58bb5fcd2620.labels" -}}
helm.sh/chart: {{ include "go-echo741042a6-8691-4a12-9fe2-58bb5fcd2620.chart" . }}
{{ include "go-echo741042a6-8691-4a12-9fe2-58bb5fcd2620.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo741042a6-8691-4a12-9fe2-58bb5fcd2620.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo741042a6-8691-4a12-9fe2-58bb5fcd2620.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
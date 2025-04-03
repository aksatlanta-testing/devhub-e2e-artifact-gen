
{{- define "go-echo6fb6fa1d-f1c8-43d9-8aa9-27196766982f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fb6fa1d-f1c8-43d9-8aa9-27196766982f.fullname" -}}
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


{{- define "go-echo6fb6fa1d-f1c8-43d9-8aa9-27196766982f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fb6fa1d-f1c8-43d9-8aa9-27196766982f.labels" -}}
helm.sh/chart: {{ include "go-echo6fb6fa1d-f1c8-43d9-8aa9-27196766982f.chart" . }}
{{ include "go-echo6fb6fa1d-f1c8-43d9-8aa9-27196766982f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6fb6fa1d-f1c8-43d9-8aa9-27196766982f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6fb6fa1d-f1c8-43d9-8aa9-27196766982f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo6f471c6b-b2ef-45e7-a0a4-1c35fdc774dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f471c6b-b2ef-45e7-a0a4-1c35fdc774dd.fullname" -}}
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


{{- define "go-echo6f471c6b-b2ef-45e7-a0a4-1c35fdc774dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6f471c6b-b2ef-45e7-a0a4-1c35fdc774dd.labels" -}}
helm.sh/chart: {{ include "go-echo6f471c6b-b2ef-45e7-a0a4-1c35fdc774dd.chart" . }}
{{ include "go-echo6f471c6b-b2ef-45e7-a0a4-1c35fdc774dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6f471c6b-b2ef-45e7-a0a4-1c35fdc774dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6f471c6b-b2ef-45e7-a0a4-1c35fdc774dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
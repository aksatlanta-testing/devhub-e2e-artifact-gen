
{{- define "go-echo47b4937e-eab7-486a-8380-294131e8c27c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47b4937e-eab7-486a-8380-294131e8c27c.fullname" -}}
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


{{- define "go-echo47b4937e-eab7-486a-8380-294131e8c27c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47b4937e-eab7-486a-8380-294131e8c27c.labels" -}}
helm.sh/chart: {{ include "go-echo47b4937e-eab7-486a-8380-294131e8c27c.chart" . }}
{{ include "go-echo47b4937e-eab7-486a-8380-294131e8c27c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo47b4937e-eab7-486a-8380-294131e8c27c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo47b4937e-eab7-486a-8380-294131e8c27c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
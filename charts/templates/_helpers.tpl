
{{- define "go-echo57b33ab7-b825-41e8-a1d7-60e6a2727d7e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57b33ab7-b825-41e8-a1d7-60e6a2727d7e.fullname" -}}
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


{{- define "go-echo57b33ab7-b825-41e8-a1d7-60e6a2727d7e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57b33ab7-b825-41e8-a1d7-60e6a2727d7e.labels" -}}
helm.sh/chart: {{ include "go-echo57b33ab7-b825-41e8-a1d7-60e6a2727d7e.chart" . }}
{{ include "go-echo57b33ab7-b825-41e8-a1d7-60e6a2727d7e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57b33ab7-b825-41e8-a1d7-60e6a2727d7e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57b33ab7-b825-41e8-a1d7-60e6a2727d7e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
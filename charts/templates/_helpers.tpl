
{{- define "go-echo0b878a58-5899-49c6-aa8b-cab033561744.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b878a58-5899-49c6-aa8b-cab033561744.fullname" -}}
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


{{- define "go-echo0b878a58-5899-49c6-aa8b-cab033561744.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0b878a58-5899-49c6-aa8b-cab033561744.labels" -}}
helm.sh/chart: {{ include "go-echo0b878a58-5899-49c6-aa8b-cab033561744.chart" . }}
{{ include "go-echo0b878a58-5899-49c6-aa8b-cab033561744.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0b878a58-5899-49c6-aa8b-cab033561744.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0b878a58-5899-49c6-aa8b-cab033561744.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
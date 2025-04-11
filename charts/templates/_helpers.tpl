
{{- define "go-echo0f2108a4-4291-4970-9b41-c663672c41de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f2108a4-4291-4970-9b41-c663672c41de.fullname" -}}
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


{{- define "go-echo0f2108a4-4291-4970-9b41-c663672c41de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f2108a4-4291-4970-9b41-c663672c41de.labels" -}}
helm.sh/chart: {{ include "go-echo0f2108a4-4291-4970-9b41-c663672c41de.chart" . }}
{{ include "go-echo0f2108a4-4291-4970-9b41-c663672c41de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f2108a4-4291-4970-9b41-c663672c41de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f2108a4-4291-4970-9b41-c663672c41de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
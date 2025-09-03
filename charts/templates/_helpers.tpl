
{{- define "go-echo73996ca2-4fe8-4204-9734-b366b901279b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo73996ca2-4fe8-4204-9734-b366b901279b.fullname" -}}
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


{{- define "go-echo73996ca2-4fe8-4204-9734-b366b901279b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo73996ca2-4fe8-4204-9734-b366b901279b.labels" -}}
helm.sh/chart: {{ include "go-echo73996ca2-4fe8-4204-9734-b366b901279b.chart" . }}
{{ include "go-echo73996ca2-4fe8-4204-9734-b366b901279b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo73996ca2-4fe8-4204-9734-b366b901279b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo73996ca2-4fe8-4204-9734-b366b901279b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
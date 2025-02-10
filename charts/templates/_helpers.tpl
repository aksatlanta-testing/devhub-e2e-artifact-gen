
{{- define "go-echobe8dfcaa-b53b-4a7e-9151-2d79d772311a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe8dfcaa-b53b-4a7e-9151-2d79d772311a.fullname" -}}
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


{{- define "go-echobe8dfcaa-b53b-4a7e-9151-2d79d772311a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe8dfcaa-b53b-4a7e-9151-2d79d772311a.labels" -}}
helm.sh/chart: {{ include "go-echobe8dfcaa-b53b-4a7e-9151-2d79d772311a.chart" . }}
{{ include "go-echobe8dfcaa-b53b-4a7e-9151-2d79d772311a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe8dfcaa-b53b-4a7e-9151-2d79d772311a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe8dfcaa-b53b-4a7e-9151-2d79d772311a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
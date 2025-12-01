
{{- define "go-echo6cb525fc-7a12-45ee-8b7b-ddb2b7c73e9c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6cb525fc-7a12-45ee-8b7b-ddb2b7c73e9c.fullname" -}}
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


{{- define "go-echo6cb525fc-7a12-45ee-8b7b-ddb2b7c73e9c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6cb525fc-7a12-45ee-8b7b-ddb2b7c73e9c.labels" -}}
helm.sh/chart: {{ include "go-echo6cb525fc-7a12-45ee-8b7b-ddb2b7c73e9c.chart" . }}
{{ include "go-echo6cb525fc-7a12-45ee-8b7b-ddb2b7c73e9c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6cb525fc-7a12-45ee-8b7b-ddb2b7c73e9c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6cb525fc-7a12-45ee-8b7b-ddb2b7c73e9c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
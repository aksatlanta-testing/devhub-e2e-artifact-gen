
{{- define "go-echo28bf9d18-070a-47d1-8419-01228f5d7e8a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo28bf9d18-070a-47d1-8419-01228f5d7e8a.fullname" -}}
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


{{- define "go-echo28bf9d18-070a-47d1-8419-01228f5d7e8a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo28bf9d18-070a-47d1-8419-01228f5d7e8a.labels" -}}
helm.sh/chart: {{ include "go-echo28bf9d18-070a-47d1-8419-01228f5d7e8a.chart" . }}
{{ include "go-echo28bf9d18-070a-47d1-8419-01228f5d7e8a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo28bf9d18-070a-47d1-8419-01228f5d7e8a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo28bf9d18-070a-47d1-8419-01228f5d7e8a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
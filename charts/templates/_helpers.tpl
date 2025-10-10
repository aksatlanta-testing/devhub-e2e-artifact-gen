
{{- define "go-echo23afa020-07b2-4282-81b7-5eed9135494b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23afa020-07b2-4282-81b7-5eed9135494b.fullname" -}}
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


{{- define "go-echo23afa020-07b2-4282-81b7-5eed9135494b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23afa020-07b2-4282-81b7-5eed9135494b.labels" -}}
helm.sh/chart: {{ include "go-echo23afa020-07b2-4282-81b7-5eed9135494b.chart" . }}
{{ include "go-echo23afa020-07b2-4282-81b7-5eed9135494b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo23afa020-07b2-4282-81b7-5eed9135494b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo23afa020-07b2-4282-81b7-5eed9135494b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
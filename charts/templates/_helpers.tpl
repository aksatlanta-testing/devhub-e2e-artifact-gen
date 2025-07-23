
{{- define "go-echo1ba37ece-9afd-48be-8588-afa797ffa837.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1ba37ece-9afd-48be-8588-afa797ffa837.fullname" -}}
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


{{- define "go-echo1ba37ece-9afd-48be-8588-afa797ffa837.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1ba37ece-9afd-48be-8588-afa797ffa837.labels" -}}
helm.sh/chart: {{ include "go-echo1ba37ece-9afd-48be-8588-afa797ffa837.chart" . }}
{{ include "go-echo1ba37ece-9afd-48be-8588-afa797ffa837.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1ba37ece-9afd-48be-8588-afa797ffa837.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1ba37ece-9afd-48be-8588-afa797ffa837.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
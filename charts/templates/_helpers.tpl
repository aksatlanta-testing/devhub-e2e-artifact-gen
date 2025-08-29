
{{- define "go-echo525fc6d8-a77c-4c26-94a5-dcced4ddb7ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo525fc6d8-a77c-4c26-94a5-dcced4ddb7ac.fullname" -}}
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


{{- define "go-echo525fc6d8-a77c-4c26-94a5-dcced4ddb7ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo525fc6d8-a77c-4c26-94a5-dcced4ddb7ac.labels" -}}
helm.sh/chart: {{ include "go-echo525fc6d8-a77c-4c26-94a5-dcced4ddb7ac.chart" . }}
{{ include "go-echo525fc6d8-a77c-4c26-94a5-dcced4ddb7ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo525fc6d8-a77c-4c26-94a5-dcced4ddb7ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo525fc6d8-a77c-4c26-94a5-dcced4ddb7ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
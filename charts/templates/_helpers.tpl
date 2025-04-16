
{{- define "go-echo1ececd12-91a9-4ab8-81ec-09a8788890fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1ececd12-91a9-4ab8-81ec-09a8788890fd.fullname" -}}
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


{{- define "go-echo1ececd12-91a9-4ab8-81ec-09a8788890fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1ececd12-91a9-4ab8-81ec-09a8788890fd.labels" -}}
helm.sh/chart: {{ include "go-echo1ececd12-91a9-4ab8-81ec-09a8788890fd.chart" . }}
{{ include "go-echo1ececd12-91a9-4ab8-81ec-09a8788890fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1ececd12-91a9-4ab8-81ec-09a8788890fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1ececd12-91a9-4ab8-81ec-09a8788890fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
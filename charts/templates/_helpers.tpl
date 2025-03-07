
{{- define "go-echoa01cc7e9-313a-4667-aa4b-178bcd4dd847.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa01cc7e9-313a-4667-aa4b-178bcd4dd847.fullname" -}}
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


{{- define "go-echoa01cc7e9-313a-4667-aa4b-178bcd4dd847.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa01cc7e9-313a-4667-aa4b-178bcd4dd847.labels" -}}
helm.sh/chart: {{ include "go-echoa01cc7e9-313a-4667-aa4b-178bcd4dd847.chart" . }}
{{ include "go-echoa01cc7e9-313a-4667-aa4b-178bcd4dd847.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa01cc7e9-313a-4667-aa4b-178bcd4dd847.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa01cc7e9-313a-4667-aa4b-178bcd4dd847.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
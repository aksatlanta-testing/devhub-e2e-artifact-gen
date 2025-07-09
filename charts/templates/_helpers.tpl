
{{- define "go-echoce92ed9b-4e82-4fb7-9d87-ea9f17949bda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce92ed9b-4e82-4fb7-9d87-ea9f17949bda.fullname" -}}
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


{{- define "go-echoce92ed9b-4e82-4fb7-9d87-ea9f17949bda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce92ed9b-4e82-4fb7-9d87-ea9f17949bda.labels" -}}
helm.sh/chart: {{ include "go-echoce92ed9b-4e82-4fb7-9d87-ea9f17949bda.chart" . }}
{{ include "go-echoce92ed9b-4e82-4fb7-9d87-ea9f17949bda.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce92ed9b-4e82-4fb7-9d87-ea9f17949bda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce92ed9b-4e82-4fb7-9d87-ea9f17949bda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
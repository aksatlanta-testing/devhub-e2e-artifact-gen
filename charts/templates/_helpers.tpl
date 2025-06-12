
{{- define "go-echoa099cab9-a76a-4680-ae53-6eb7ddf233ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa099cab9-a76a-4680-ae53-6eb7ddf233ef.fullname" -}}
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


{{- define "go-echoa099cab9-a76a-4680-ae53-6eb7ddf233ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa099cab9-a76a-4680-ae53-6eb7ddf233ef.labels" -}}
helm.sh/chart: {{ include "go-echoa099cab9-a76a-4680-ae53-6eb7ddf233ef.chart" . }}
{{ include "go-echoa099cab9-a76a-4680-ae53-6eb7ddf233ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa099cab9-a76a-4680-ae53-6eb7ddf233ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa099cab9-a76a-4680-ae53-6eb7ddf233ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
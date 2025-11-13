
{{- define "go-echoffa69d16-fd99-477a-80c7-a6a211137d69.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffa69d16-fd99-477a-80c7-a6a211137d69.fullname" -}}
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


{{- define "go-echoffa69d16-fd99-477a-80c7-a6a211137d69.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffa69d16-fd99-477a-80c7-a6a211137d69.labels" -}}
helm.sh/chart: {{ include "go-echoffa69d16-fd99-477a-80c7-a6a211137d69.chart" . }}
{{ include "go-echoffa69d16-fd99-477a-80c7-a6a211137d69.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffa69d16-fd99-477a-80c7-a6a211137d69.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffa69d16-fd99-477a-80c7-a6a211137d69.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
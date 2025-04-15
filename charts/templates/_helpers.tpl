
{{- define "go-echo788735b9-5a88-4b8d-b7db-6c765a30aa2b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo788735b9-5a88-4b8d-b7db-6c765a30aa2b.fullname" -}}
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


{{- define "go-echo788735b9-5a88-4b8d-b7db-6c765a30aa2b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo788735b9-5a88-4b8d-b7db-6c765a30aa2b.labels" -}}
helm.sh/chart: {{ include "go-echo788735b9-5a88-4b8d-b7db-6c765a30aa2b.chart" . }}
{{ include "go-echo788735b9-5a88-4b8d-b7db-6c765a30aa2b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo788735b9-5a88-4b8d-b7db-6c765a30aa2b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo788735b9-5a88-4b8d-b7db-6c765a30aa2b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
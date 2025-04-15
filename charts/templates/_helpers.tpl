
{{- define "go-echofbaa503a-5499-4356-b50d-2f80e1683bbf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbaa503a-5499-4356-b50d-2f80e1683bbf.fullname" -}}
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


{{- define "go-echofbaa503a-5499-4356-b50d-2f80e1683bbf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbaa503a-5499-4356-b50d-2f80e1683bbf.labels" -}}
helm.sh/chart: {{ include "go-echofbaa503a-5499-4356-b50d-2f80e1683bbf.chart" . }}
{{ include "go-echofbaa503a-5499-4356-b50d-2f80e1683bbf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofbaa503a-5499-4356-b50d-2f80e1683bbf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbaa503a-5499-4356-b50d-2f80e1683bbf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echodc220067-0db2-4b25-8d9b-b09643e23879.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc220067-0db2-4b25-8d9b-b09643e23879.fullname" -}}
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


{{- define "go-echodc220067-0db2-4b25-8d9b-b09643e23879.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodc220067-0db2-4b25-8d9b-b09643e23879.labels" -}}
helm.sh/chart: {{ include "go-echodc220067-0db2-4b25-8d9b-b09643e23879.chart" . }}
{{ include "go-echodc220067-0db2-4b25-8d9b-b09643e23879.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodc220067-0db2-4b25-8d9b-b09643e23879.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodc220067-0db2-4b25-8d9b-b09643e23879.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo9f8a0a28-b198-4954-971f-8e624920a736.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f8a0a28-b198-4954-971f-8e624920a736.fullname" -}}
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


{{- define "go-echo9f8a0a28-b198-4954-971f-8e624920a736.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f8a0a28-b198-4954-971f-8e624920a736.labels" -}}
helm.sh/chart: {{ include "go-echo9f8a0a28-b198-4954-971f-8e624920a736.chart" . }}
{{ include "go-echo9f8a0a28-b198-4954-971f-8e624920a736.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9f8a0a28-b198-4954-971f-8e624920a736.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9f8a0a28-b198-4954-971f-8e624920a736.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
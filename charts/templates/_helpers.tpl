
{{- define "go-echoa614bb77-ae41-4285-bf69-fc457c1de28e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa614bb77-ae41-4285-bf69-fc457c1de28e.fullname" -}}
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


{{- define "go-echoa614bb77-ae41-4285-bf69-fc457c1de28e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa614bb77-ae41-4285-bf69-fc457c1de28e.labels" -}}
helm.sh/chart: {{ include "go-echoa614bb77-ae41-4285-bf69-fc457c1de28e.chart" . }}
{{ include "go-echoa614bb77-ae41-4285-bf69-fc457c1de28e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa614bb77-ae41-4285-bf69-fc457c1de28e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa614bb77-ae41-4285-bf69-fc457c1de28e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
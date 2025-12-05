
{{- define "go-echofbb83042-83cf-47cc-82bf-031fe87d71be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbb83042-83cf-47cc-82bf-031fe87d71be.fullname" -}}
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


{{- define "go-echofbb83042-83cf-47cc-82bf-031fe87d71be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbb83042-83cf-47cc-82bf-031fe87d71be.labels" -}}
helm.sh/chart: {{ include "go-echofbb83042-83cf-47cc-82bf-031fe87d71be.chart" . }}
{{ include "go-echofbb83042-83cf-47cc-82bf-031fe87d71be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofbb83042-83cf-47cc-82bf-031fe87d71be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbb83042-83cf-47cc-82bf-031fe87d71be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
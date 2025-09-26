
{{- define "go-echo8d600c7d-dec8-4aa0-9bfd-42989ec78300.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d600c7d-dec8-4aa0-9bfd-42989ec78300.fullname" -}}
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


{{- define "go-echo8d600c7d-dec8-4aa0-9bfd-42989ec78300.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d600c7d-dec8-4aa0-9bfd-42989ec78300.labels" -}}
helm.sh/chart: {{ include "go-echo8d600c7d-dec8-4aa0-9bfd-42989ec78300.chart" . }}
{{ include "go-echo8d600c7d-dec8-4aa0-9bfd-42989ec78300.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8d600c7d-dec8-4aa0-9bfd-42989ec78300.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8d600c7d-dec8-4aa0-9bfd-42989ec78300.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
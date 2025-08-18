
{{- define "go-echod1c40b73-da00-4640-abf9-f57b98d0ff90.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1c40b73-da00-4640-abf9-f57b98d0ff90.fullname" -}}
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


{{- define "go-echod1c40b73-da00-4640-abf9-f57b98d0ff90.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1c40b73-da00-4640-abf9-f57b98d0ff90.labels" -}}
helm.sh/chart: {{ include "go-echod1c40b73-da00-4640-abf9-f57b98d0ff90.chart" . }}
{{ include "go-echod1c40b73-da00-4640-abf9-f57b98d0ff90.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1c40b73-da00-4640-abf9-f57b98d0ff90.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1c40b73-da00-4640-abf9-f57b98d0ff90.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
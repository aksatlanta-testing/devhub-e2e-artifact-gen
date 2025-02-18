
{{- define "go-echoddd75b06-f55d-4999-a5d6-e47cba591cd1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoddd75b06-f55d-4999-a5d6-e47cba591cd1.fullname" -}}
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


{{- define "go-echoddd75b06-f55d-4999-a5d6-e47cba591cd1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoddd75b06-f55d-4999-a5d6-e47cba591cd1.labels" -}}
helm.sh/chart: {{ include "go-echoddd75b06-f55d-4999-a5d6-e47cba591cd1.chart" . }}
{{ include "go-echoddd75b06-f55d-4999-a5d6-e47cba591cd1.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoddd75b06-f55d-4999-a5d6-e47cba591cd1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoddd75b06-f55d-4999-a5d6-e47cba591cd1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
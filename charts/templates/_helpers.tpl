
{{- define "go-echoc2b33608-8118-4e28-bb8f-e375f8a5e103.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2b33608-8118-4e28-bb8f-e375f8a5e103.fullname" -}}
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


{{- define "go-echoc2b33608-8118-4e28-bb8f-e375f8a5e103.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc2b33608-8118-4e28-bb8f-e375f8a5e103.labels" -}}
helm.sh/chart: {{ include "go-echoc2b33608-8118-4e28-bb8f-e375f8a5e103.chart" . }}
{{ include "go-echoc2b33608-8118-4e28-bb8f-e375f8a5e103.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc2b33608-8118-4e28-bb8f-e375f8a5e103.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc2b33608-8118-4e28-bb8f-e375f8a5e103.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
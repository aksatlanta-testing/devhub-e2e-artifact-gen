
{{- define "go-echo5f9c2c81-d8a5-4fb8-9644-2edfce8093de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5f9c2c81-d8a5-4fb8-9644-2edfce8093de.fullname" -}}
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


{{- define "go-echo5f9c2c81-d8a5-4fb8-9644-2edfce8093de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5f9c2c81-d8a5-4fb8-9644-2edfce8093de.labels" -}}
helm.sh/chart: {{ include "go-echo5f9c2c81-d8a5-4fb8-9644-2edfce8093de.chart" . }}
{{ include "go-echo5f9c2c81-d8a5-4fb8-9644-2edfce8093de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5f9c2c81-d8a5-4fb8-9644-2edfce8093de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5f9c2c81-d8a5-4fb8-9644-2edfce8093de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
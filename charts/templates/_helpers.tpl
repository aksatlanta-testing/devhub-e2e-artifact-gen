
{{- define "go-echobf5f2bc3-9f09-47d9-aa46-d17e82e38217.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf5f2bc3-9f09-47d9-aa46-d17e82e38217.fullname" -}}
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


{{- define "go-echobf5f2bc3-9f09-47d9-aa46-d17e82e38217.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf5f2bc3-9f09-47d9-aa46-d17e82e38217.labels" -}}
helm.sh/chart: {{ include "go-echobf5f2bc3-9f09-47d9-aa46-d17e82e38217.chart" . }}
{{ include "go-echobf5f2bc3-9f09-47d9-aa46-d17e82e38217.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf5f2bc3-9f09-47d9-aa46-d17e82e38217.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf5f2bc3-9f09-47d9-aa46-d17e82e38217.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
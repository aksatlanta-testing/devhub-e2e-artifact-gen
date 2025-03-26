
{{- define "go-echobf5c4616-e627-46b0-87c0-27638c3b1ecd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf5c4616-e627-46b0-87c0-27638c3b1ecd.fullname" -}}
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


{{- define "go-echobf5c4616-e627-46b0-87c0-27638c3b1ecd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf5c4616-e627-46b0-87c0-27638c3b1ecd.labels" -}}
helm.sh/chart: {{ include "go-echobf5c4616-e627-46b0-87c0-27638c3b1ecd.chart" . }}
{{ include "go-echobf5c4616-e627-46b0-87c0-27638c3b1ecd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf5c4616-e627-46b0-87c0-27638c3b1ecd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf5c4616-e627-46b0-87c0-27638c3b1ecd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
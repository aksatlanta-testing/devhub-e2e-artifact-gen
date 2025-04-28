
{{- define "go-echoe3b8437f-832f-426f-be09-ed4b6fc5f37e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3b8437f-832f-426f-be09-ed4b6fc5f37e.fullname" -}}
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


{{- define "go-echoe3b8437f-832f-426f-be09-ed4b6fc5f37e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe3b8437f-832f-426f-be09-ed4b6fc5f37e.labels" -}}
helm.sh/chart: {{ include "go-echoe3b8437f-832f-426f-be09-ed4b6fc5f37e.chart" . }}
{{ include "go-echoe3b8437f-832f-426f-be09-ed4b6fc5f37e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe3b8437f-832f-426f-be09-ed4b6fc5f37e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe3b8437f-832f-426f-be09-ed4b6fc5f37e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
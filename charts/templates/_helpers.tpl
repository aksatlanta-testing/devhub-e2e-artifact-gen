
{{- define "go-echobda3343b-b629-4a74-907f-03c7834a0d39.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobda3343b-b629-4a74-907f-03c7834a0d39.fullname" -}}
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


{{- define "go-echobda3343b-b629-4a74-907f-03c7834a0d39.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobda3343b-b629-4a74-907f-03c7834a0d39.labels" -}}
helm.sh/chart: {{ include "go-echobda3343b-b629-4a74-907f-03c7834a0d39.chart" . }}
{{ include "go-echobda3343b-b629-4a74-907f-03c7834a0d39.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobda3343b-b629-4a74-907f-03c7834a0d39.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobda3343b-b629-4a74-907f-03c7834a0d39.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
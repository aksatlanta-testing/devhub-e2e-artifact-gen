
{{- define "go-echo55f5dbf8-9ba6-4ae3-9938-1b518113cdaa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo55f5dbf8-9ba6-4ae3-9938-1b518113cdaa.fullname" -}}
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


{{- define "go-echo55f5dbf8-9ba6-4ae3-9938-1b518113cdaa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo55f5dbf8-9ba6-4ae3-9938-1b518113cdaa.labels" -}}
helm.sh/chart: {{ include "go-echo55f5dbf8-9ba6-4ae3-9938-1b518113cdaa.chart" . }}
{{ include "go-echo55f5dbf8-9ba6-4ae3-9938-1b518113cdaa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo55f5dbf8-9ba6-4ae3-9938-1b518113cdaa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo55f5dbf8-9ba6-4ae3-9938-1b518113cdaa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
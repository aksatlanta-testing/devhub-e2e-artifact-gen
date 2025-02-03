
{{- define "go-echof129acaa-0103-421b-b999-c64f813e78aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof129acaa-0103-421b-b999-c64f813e78aa.fullname" -}}
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


{{- define "go-echof129acaa-0103-421b-b999-c64f813e78aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof129acaa-0103-421b-b999-c64f813e78aa.labels" -}}
helm.sh/chart: {{ include "go-echof129acaa-0103-421b-b999-c64f813e78aa.chart" . }}
{{ include "go-echof129acaa-0103-421b-b999-c64f813e78aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof129acaa-0103-421b-b999-c64f813e78aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof129acaa-0103-421b-b999-c64f813e78aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
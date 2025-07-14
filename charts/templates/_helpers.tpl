
{{- define "go-echofa558aac-cf4b-464f-a54a-5936a499b122.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa558aac-cf4b-464f-a54a-5936a499b122.fullname" -}}
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


{{- define "go-echofa558aac-cf4b-464f-a54a-5936a499b122.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa558aac-cf4b-464f-a54a-5936a499b122.labels" -}}
helm.sh/chart: {{ include "go-echofa558aac-cf4b-464f-a54a-5936a499b122.chart" . }}
{{ include "go-echofa558aac-cf4b-464f-a54a-5936a499b122.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa558aac-cf4b-464f-a54a-5936a499b122.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa558aac-cf4b-464f-a54a-5936a499b122.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
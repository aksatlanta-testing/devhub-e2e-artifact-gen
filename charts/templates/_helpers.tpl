
{{- define "go-echof496fb8b-b2be-4f7d-ba5f-8a14a12c0c21.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof496fb8b-b2be-4f7d-ba5f-8a14a12c0c21.fullname" -}}
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


{{- define "go-echof496fb8b-b2be-4f7d-ba5f-8a14a12c0c21.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof496fb8b-b2be-4f7d-ba5f-8a14a12c0c21.labels" -}}
helm.sh/chart: {{ include "go-echof496fb8b-b2be-4f7d-ba5f-8a14a12c0c21.chart" . }}
{{ include "go-echof496fb8b-b2be-4f7d-ba5f-8a14a12c0c21.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof496fb8b-b2be-4f7d-ba5f-8a14a12c0c21.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof496fb8b-b2be-4f7d-ba5f-8a14a12c0c21.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
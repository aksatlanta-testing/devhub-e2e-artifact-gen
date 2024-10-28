
{{- define "go-echo653524e7-ef9b-4312-b4cd-d83d9ab0d002.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo653524e7-ef9b-4312-b4cd-d83d9ab0d002.fullname" -}}
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


{{- define "go-echo653524e7-ef9b-4312-b4cd-d83d9ab0d002.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo653524e7-ef9b-4312-b4cd-d83d9ab0d002.labels" -}}
helm.sh/chart: {{ include "go-echo653524e7-ef9b-4312-b4cd-d83d9ab0d002.chart" . }}
{{ include "go-echo653524e7-ef9b-4312-b4cd-d83d9ab0d002.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo653524e7-ef9b-4312-b4cd-d83d9ab0d002.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo653524e7-ef9b-4312-b4cd-d83d9ab0d002.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
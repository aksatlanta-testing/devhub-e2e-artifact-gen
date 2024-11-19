
{{- define "go-echo71d4b5dc-ae91-4e76-a4f1-b827596d96f9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71d4b5dc-ae91-4e76-a4f1-b827596d96f9.fullname" -}}
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


{{- define "go-echo71d4b5dc-ae91-4e76-a4f1-b827596d96f9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71d4b5dc-ae91-4e76-a4f1-b827596d96f9.labels" -}}
helm.sh/chart: {{ include "go-echo71d4b5dc-ae91-4e76-a4f1-b827596d96f9.chart" . }}
{{ include "go-echo71d4b5dc-ae91-4e76-a4f1-b827596d96f9.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo71d4b5dc-ae91-4e76-a4f1-b827596d96f9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo71d4b5dc-ae91-4e76-a4f1-b827596d96f9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
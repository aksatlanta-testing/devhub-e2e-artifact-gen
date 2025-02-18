
{{- define "go-echocbe36253-28e2-4f93-a2ca-a2211e7de254.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbe36253-28e2-4f93-a2ca-a2211e7de254.fullname" -}}
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


{{- define "go-echocbe36253-28e2-4f93-a2ca-a2211e7de254.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbe36253-28e2-4f93-a2ca-a2211e7de254.labels" -}}
helm.sh/chart: {{ include "go-echocbe36253-28e2-4f93-a2ca-a2211e7de254.chart" . }}
{{ include "go-echocbe36253-28e2-4f93-a2ca-a2211e7de254.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocbe36253-28e2-4f93-a2ca-a2211e7de254.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocbe36253-28e2-4f93-a2ca-a2211e7de254.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
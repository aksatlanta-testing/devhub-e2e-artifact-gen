
{{- define "go-echo92f3a541-b68b-4b15-89fc-e7d411bdeb19.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92f3a541-b68b-4b15-89fc-e7d411bdeb19.fullname" -}}
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


{{- define "go-echo92f3a541-b68b-4b15-89fc-e7d411bdeb19.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92f3a541-b68b-4b15-89fc-e7d411bdeb19.labels" -}}
helm.sh/chart: {{ include "go-echo92f3a541-b68b-4b15-89fc-e7d411bdeb19.chart" . }}
{{ include "go-echo92f3a541-b68b-4b15-89fc-e7d411bdeb19.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo92f3a541-b68b-4b15-89fc-e7d411bdeb19.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo92f3a541-b68b-4b15-89fc-e7d411bdeb19.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
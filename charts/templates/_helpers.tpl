
{{- define "go-echo161dbc2b-cae5-40f5-8371-8316ef3a8ada.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo161dbc2b-cae5-40f5-8371-8316ef3a8ada.fullname" -}}
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


{{- define "go-echo161dbc2b-cae5-40f5-8371-8316ef3a8ada.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo161dbc2b-cae5-40f5-8371-8316ef3a8ada.labels" -}}
helm.sh/chart: {{ include "go-echo161dbc2b-cae5-40f5-8371-8316ef3a8ada.chart" . }}
{{ include "go-echo161dbc2b-cae5-40f5-8371-8316ef3a8ada.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo161dbc2b-cae5-40f5-8371-8316ef3a8ada.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo161dbc2b-cae5-40f5-8371-8316ef3a8ada.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoe5dbc505-9f88-4651-b546-3e7d70e6f320.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5dbc505-9f88-4651-b546-3e7d70e6f320.fullname" -}}
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


{{- define "go-echoe5dbc505-9f88-4651-b546-3e7d70e6f320.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5dbc505-9f88-4651-b546-3e7d70e6f320.labels" -}}
helm.sh/chart: {{ include "go-echoe5dbc505-9f88-4651-b546-3e7d70e6f320.chart" . }}
{{ include "go-echoe5dbc505-9f88-4651-b546-3e7d70e6f320.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5dbc505-9f88-4651-b546-3e7d70e6f320.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5dbc505-9f88-4651-b546-3e7d70e6f320.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
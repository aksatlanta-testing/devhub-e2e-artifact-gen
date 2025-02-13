
{{- define "go-echoe5959f21-dfb0-4edd-bb8b-84f2d83084ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5959f21-dfb0-4edd-bb8b-84f2d83084ff.fullname" -}}
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


{{- define "go-echoe5959f21-dfb0-4edd-bb8b-84f2d83084ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5959f21-dfb0-4edd-bb8b-84f2d83084ff.labels" -}}
helm.sh/chart: {{ include "go-echoe5959f21-dfb0-4edd-bb8b-84f2d83084ff.chart" . }}
{{ include "go-echoe5959f21-dfb0-4edd-bb8b-84f2d83084ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5959f21-dfb0-4edd-bb8b-84f2d83084ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5959f21-dfb0-4edd-bb8b-84f2d83084ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
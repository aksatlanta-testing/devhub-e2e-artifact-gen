
{{- define "go-echo86d98cf8-0ea4-49fd-b50b-f3f6eedae538.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86d98cf8-0ea4-49fd-b50b-f3f6eedae538.fullname" -}}
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


{{- define "go-echo86d98cf8-0ea4-49fd-b50b-f3f6eedae538.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo86d98cf8-0ea4-49fd-b50b-f3f6eedae538.labels" -}}
helm.sh/chart: {{ include "go-echo86d98cf8-0ea4-49fd-b50b-f3f6eedae538.chart" . }}
{{ include "go-echo86d98cf8-0ea4-49fd-b50b-f3f6eedae538.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo86d98cf8-0ea4-49fd-b50b-f3f6eedae538.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo86d98cf8-0ea4-49fd-b50b-f3f6eedae538.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
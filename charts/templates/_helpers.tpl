
{{- define "go-echocf297584-1b90-4e4c-9c4c-5a75067281cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf297584-1b90-4e4c-9c4c-5a75067281cf.fullname" -}}
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


{{- define "go-echocf297584-1b90-4e4c-9c4c-5a75067281cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf297584-1b90-4e4c-9c4c-5a75067281cf.labels" -}}
helm.sh/chart: {{ include "go-echocf297584-1b90-4e4c-9c4c-5a75067281cf.chart" . }}
{{ include "go-echocf297584-1b90-4e4c-9c4c-5a75067281cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf297584-1b90-4e4c-9c4c-5a75067281cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf297584-1b90-4e4c-9c4c-5a75067281cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
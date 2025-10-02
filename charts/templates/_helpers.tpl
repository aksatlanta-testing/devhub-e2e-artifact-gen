
{{- define "go-echocdf07fdd-56d5-4b50-b6e9-28329a89ab1a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdf07fdd-56d5-4b50-b6e9-28329a89ab1a.fullname" -}}
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


{{- define "go-echocdf07fdd-56d5-4b50-b6e9-28329a89ab1a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdf07fdd-56d5-4b50-b6e9-28329a89ab1a.labels" -}}
helm.sh/chart: {{ include "go-echocdf07fdd-56d5-4b50-b6e9-28329a89ab1a.chart" . }}
{{ include "go-echocdf07fdd-56d5-4b50-b6e9-28329a89ab1a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocdf07fdd-56d5-4b50-b6e9-28329a89ab1a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocdf07fdd-56d5-4b50-b6e9-28329a89ab1a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
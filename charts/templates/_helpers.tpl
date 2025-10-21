
{{- define "go-echo63218eb8-a7fa-4cb4-9ba5-b6e9c315e32c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63218eb8-a7fa-4cb4-9ba5-b6e9c315e32c.fullname" -}}
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


{{- define "go-echo63218eb8-a7fa-4cb4-9ba5-b6e9c315e32c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo63218eb8-a7fa-4cb4-9ba5-b6e9c315e32c.labels" -}}
helm.sh/chart: {{ include "go-echo63218eb8-a7fa-4cb4-9ba5-b6e9c315e32c.chart" . }}
{{ include "go-echo63218eb8-a7fa-4cb4-9ba5-b6e9c315e32c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo63218eb8-a7fa-4cb4-9ba5-b6e9c315e32c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo63218eb8-a7fa-4cb4-9ba5-b6e9c315e32c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
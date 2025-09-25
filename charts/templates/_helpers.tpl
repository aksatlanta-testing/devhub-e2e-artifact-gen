
{{- define "go-echob0108fd4-4da8-47ff-a396-a31ae08a3fae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob0108fd4-4da8-47ff-a396-a31ae08a3fae.fullname" -}}
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


{{- define "go-echob0108fd4-4da8-47ff-a396-a31ae08a3fae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob0108fd4-4da8-47ff-a396-a31ae08a3fae.labels" -}}
helm.sh/chart: {{ include "go-echob0108fd4-4da8-47ff-a396-a31ae08a3fae.chart" . }}
{{ include "go-echob0108fd4-4da8-47ff-a396-a31ae08a3fae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob0108fd4-4da8-47ff-a396-a31ae08a3fae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob0108fd4-4da8-47ff-a396-a31ae08a3fae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
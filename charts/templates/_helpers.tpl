
{{- define "go-echo50c86a8c-39d5-4024-8340-220e3bac82ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo50c86a8c-39d5-4024-8340-220e3bac82ff.fullname" -}}
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


{{- define "go-echo50c86a8c-39d5-4024-8340-220e3bac82ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo50c86a8c-39d5-4024-8340-220e3bac82ff.labels" -}}
helm.sh/chart: {{ include "go-echo50c86a8c-39d5-4024-8340-220e3bac82ff.chart" . }}
{{ include "go-echo50c86a8c-39d5-4024-8340-220e3bac82ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo50c86a8c-39d5-4024-8340-220e3bac82ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo50c86a8c-39d5-4024-8340-220e3bac82ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoc8f80815-c178-4bf8-86a3-1c19695701bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8f80815-c178-4bf8-86a3-1c19695701bd.fullname" -}}
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


{{- define "go-echoc8f80815-c178-4bf8-86a3-1c19695701bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc8f80815-c178-4bf8-86a3-1c19695701bd.labels" -}}
helm.sh/chart: {{ include "go-echoc8f80815-c178-4bf8-86a3-1c19695701bd.chart" . }}
{{ include "go-echoc8f80815-c178-4bf8-86a3-1c19695701bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc8f80815-c178-4bf8-86a3-1c19695701bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc8f80815-c178-4bf8-86a3-1c19695701bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echofce9ed79-8646-44d6-ab1e-1f4ee9aaadca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofce9ed79-8646-44d6-ab1e-1f4ee9aaadca.fullname" -}}
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


{{- define "go-echofce9ed79-8646-44d6-ab1e-1f4ee9aaadca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofce9ed79-8646-44d6-ab1e-1f4ee9aaadca.labels" -}}
helm.sh/chart: {{ include "go-echofce9ed79-8646-44d6-ab1e-1f4ee9aaadca.chart" . }}
{{ include "go-echofce9ed79-8646-44d6-ab1e-1f4ee9aaadca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofce9ed79-8646-44d6-ab1e-1f4ee9aaadca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofce9ed79-8646-44d6-ab1e-1f4ee9aaadca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
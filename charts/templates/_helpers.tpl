
{{- define "go-echof97daca9-f48c-4a70-a7a8-db5ee5a1561e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof97daca9-f48c-4a70-a7a8-db5ee5a1561e.fullname" -}}
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


{{- define "go-echof97daca9-f48c-4a70-a7a8-db5ee5a1561e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof97daca9-f48c-4a70-a7a8-db5ee5a1561e.labels" -}}
helm.sh/chart: {{ include "go-echof97daca9-f48c-4a70-a7a8-db5ee5a1561e.chart" . }}
{{ include "go-echof97daca9-f48c-4a70-a7a8-db5ee5a1561e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof97daca9-f48c-4a70-a7a8-db5ee5a1561e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof97daca9-f48c-4a70-a7a8-db5ee5a1561e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
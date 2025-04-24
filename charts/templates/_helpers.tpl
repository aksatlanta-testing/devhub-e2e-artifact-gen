
{{- define "go-echoff5b0749-8cb8-4784-b3c6-8fd08563846b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff5b0749-8cb8-4784-b3c6-8fd08563846b.fullname" -}}
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


{{- define "go-echoff5b0749-8cb8-4784-b3c6-8fd08563846b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff5b0749-8cb8-4784-b3c6-8fd08563846b.labels" -}}
helm.sh/chart: {{ include "go-echoff5b0749-8cb8-4784-b3c6-8fd08563846b.chart" . }}
{{ include "go-echoff5b0749-8cb8-4784-b3c6-8fd08563846b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff5b0749-8cb8-4784-b3c6-8fd08563846b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff5b0749-8cb8-4784-b3c6-8fd08563846b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
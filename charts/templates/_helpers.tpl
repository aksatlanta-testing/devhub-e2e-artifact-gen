
{{- define "go-echoc4c6b0ee-a196-4550-af36-f3a27d45d55f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4c6b0ee-a196-4550-af36-f3a27d45d55f.fullname" -}}
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


{{- define "go-echoc4c6b0ee-a196-4550-af36-f3a27d45d55f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc4c6b0ee-a196-4550-af36-f3a27d45d55f.labels" -}}
helm.sh/chart: {{ include "go-echoc4c6b0ee-a196-4550-af36-f3a27d45d55f.chart" . }}
{{ include "go-echoc4c6b0ee-a196-4550-af36-f3a27d45d55f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc4c6b0ee-a196-4550-af36-f3a27d45d55f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc4c6b0ee-a196-4550-af36-f3a27d45d55f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echod4b9d81b-2733-4d36-ac8e-7f3cdfe8f044.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4b9d81b-2733-4d36-ac8e-7f3cdfe8f044.fullname" -}}
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


{{- define "go-echod4b9d81b-2733-4d36-ac8e-7f3cdfe8f044.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4b9d81b-2733-4d36-ac8e-7f3cdfe8f044.labels" -}}
helm.sh/chart: {{ include "go-echod4b9d81b-2733-4d36-ac8e-7f3cdfe8f044.chart" . }}
{{ include "go-echod4b9d81b-2733-4d36-ac8e-7f3cdfe8f044.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod4b9d81b-2733-4d36-ac8e-7f3cdfe8f044.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod4b9d81b-2733-4d36-ac8e-7f3cdfe8f044.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
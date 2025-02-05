
{{- define "go-echoff37f519-7e4d-40e7-9342-0e2a2119ad33.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff37f519-7e4d-40e7-9342-0e2a2119ad33.fullname" -}}
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


{{- define "go-echoff37f519-7e4d-40e7-9342-0e2a2119ad33.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoff37f519-7e4d-40e7-9342-0e2a2119ad33.labels" -}}
helm.sh/chart: {{ include "go-echoff37f519-7e4d-40e7-9342-0e2a2119ad33.chart" . }}
{{ include "go-echoff37f519-7e4d-40e7-9342-0e2a2119ad33.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoff37f519-7e4d-40e7-9342-0e2a2119ad33.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoff37f519-7e4d-40e7-9342-0e2a2119ad33.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
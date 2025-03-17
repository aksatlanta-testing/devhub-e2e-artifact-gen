
{{- define "go-echoa5628cb2-dd81-4d3e-abb2-0b03f00d349d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa5628cb2-dd81-4d3e-abb2-0b03f00d349d.fullname" -}}
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


{{- define "go-echoa5628cb2-dd81-4d3e-abb2-0b03f00d349d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa5628cb2-dd81-4d3e-abb2-0b03f00d349d.labels" -}}
helm.sh/chart: {{ include "go-echoa5628cb2-dd81-4d3e-abb2-0b03f00d349d.chart" . }}
{{ include "go-echoa5628cb2-dd81-4d3e-abb2-0b03f00d349d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa5628cb2-dd81-4d3e-abb2-0b03f00d349d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa5628cb2-dd81-4d3e-abb2-0b03f00d349d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
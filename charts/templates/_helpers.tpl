
{{- define "go-echofd33484c-c825-4743-88d3-58083077b40e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd33484c-c825-4743-88d3-58083077b40e.fullname" -}}
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


{{- define "go-echofd33484c-c825-4743-88d3-58083077b40e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd33484c-c825-4743-88d3-58083077b40e.labels" -}}
helm.sh/chart: {{ include "go-echofd33484c-c825-4743-88d3-58083077b40e.chart" . }}
{{ include "go-echofd33484c-c825-4743-88d3-58083077b40e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd33484c-c825-4743-88d3-58083077b40e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd33484c-c825-4743-88d3-58083077b40e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
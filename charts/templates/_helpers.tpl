
{{- define "go-echoec8ceb99-d862-45f1-adf3-6e5592a2110e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec8ceb99-d862-45f1-adf3-6e5592a2110e.fullname" -}}
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


{{- define "go-echoec8ceb99-d862-45f1-adf3-6e5592a2110e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec8ceb99-d862-45f1-adf3-6e5592a2110e.labels" -}}
helm.sh/chart: {{ include "go-echoec8ceb99-d862-45f1-adf3-6e5592a2110e.chart" . }}
{{ include "go-echoec8ceb99-d862-45f1-adf3-6e5592a2110e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec8ceb99-d862-45f1-adf3-6e5592a2110e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec8ceb99-d862-45f1-adf3-6e5592a2110e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
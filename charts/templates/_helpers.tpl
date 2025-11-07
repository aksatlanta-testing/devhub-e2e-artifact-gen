
{{- define "go-echofe7bae6b-5c82-4d60-9b21-3f7c85966723.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe7bae6b-5c82-4d60-9b21-3f7c85966723.fullname" -}}
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


{{- define "go-echofe7bae6b-5c82-4d60-9b21-3f7c85966723.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofe7bae6b-5c82-4d60-9b21-3f7c85966723.labels" -}}
helm.sh/chart: {{ include "go-echofe7bae6b-5c82-4d60-9b21-3f7c85966723.chart" . }}
{{ include "go-echofe7bae6b-5c82-4d60-9b21-3f7c85966723.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofe7bae6b-5c82-4d60-9b21-3f7c85966723.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofe7bae6b-5c82-4d60-9b21-3f7c85966723.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
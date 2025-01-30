
{{- define "go-echoee279197-1046-4a8b-974a-0c8f8e2788ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee279197-1046-4a8b-974a-0c8f8e2788ac.fullname" -}}
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


{{- define "go-echoee279197-1046-4a8b-974a-0c8f8e2788ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee279197-1046-4a8b-974a-0c8f8e2788ac.labels" -}}
helm.sh/chart: {{ include "go-echoee279197-1046-4a8b-974a-0c8f8e2788ac.chart" . }}
{{ include "go-echoee279197-1046-4a8b-974a-0c8f8e2788ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee279197-1046-4a8b-974a-0c8f8e2788ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee279197-1046-4a8b-974a-0c8f8e2788ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
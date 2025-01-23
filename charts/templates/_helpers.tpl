
{{- define "go-echofc851c97-bb3f-49a3-9c1a-a25d2e815095.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc851c97-bb3f-49a3-9c1a-a25d2e815095.fullname" -}}
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


{{- define "go-echofc851c97-bb3f-49a3-9c1a-a25d2e815095.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc851c97-bb3f-49a3-9c1a-a25d2e815095.labels" -}}
helm.sh/chart: {{ include "go-echofc851c97-bb3f-49a3-9c1a-a25d2e815095.chart" . }}
{{ include "go-echofc851c97-bb3f-49a3-9c1a-a25d2e815095.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc851c97-bb3f-49a3-9c1a-a25d2e815095.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc851c97-bb3f-49a3-9c1a-a25d2e815095.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
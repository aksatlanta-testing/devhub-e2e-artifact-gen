
{{- define "go-echo99040236-c0e1-450a-9a9a-dcbd16903b17.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99040236-c0e1-450a-9a9a-dcbd16903b17.fullname" -}}
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


{{- define "go-echo99040236-c0e1-450a-9a9a-dcbd16903b17.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo99040236-c0e1-450a-9a9a-dcbd16903b17.labels" -}}
helm.sh/chart: {{ include "go-echo99040236-c0e1-450a-9a9a-dcbd16903b17.chart" . }}
{{ include "go-echo99040236-c0e1-450a-9a9a-dcbd16903b17.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo99040236-c0e1-450a-9a9a-dcbd16903b17.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo99040236-c0e1-450a-9a9a-dcbd16903b17.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoac21e38e-2335-422c-89ea-ea7fc01b6ad6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac21e38e-2335-422c-89ea-ea7fc01b6ad6.fullname" -}}
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


{{- define "go-echoac21e38e-2335-422c-89ea-ea7fc01b6ad6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac21e38e-2335-422c-89ea-ea7fc01b6ad6.labels" -}}
helm.sh/chart: {{ include "go-echoac21e38e-2335-422c-89ea-ea7fc01b6ad6.chart" . }}
{{ include "go-echoac21e38e-2335-422c-89ea-ea7fc01b6ad6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac21e38e-2335-422c-89ea-ea7fc01b6ad6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac21e38e-2335-422c-89ea-ea7fc01b6ad6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
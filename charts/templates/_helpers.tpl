
{{- define "go-echoefdc0708-665e-47e4-91f7-347a1b04921a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefdc0708-665e-47e4-91f7-347a1b04921a.fullname" -}}
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


{{- define "go-echoefdc0708-665e-47e4-91f7-347a1b04921a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoefdc0708-665e-47e4-91f7-347a1b04921a.labels" -}}
helm.sh/chart: {{ include "go-echoefdc0708-665e-47e4-91f7-347a1b04921a.chart" . }}
{{ include "go-echoefdc0708-665e-47e4-91f7-347a1b04921a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoefdc0708-665e-47e4-91f7-347a1b04921a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoefdc0708-665e-47e4-91f7-347a1b04921a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoebe29a2c-fd3b-4e5c-bd1b-7c821808a277.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebe29a2c-fd3b-4e5c-bd1b-7c821808a277.fullname" -}}
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


{{- define "go-echoebe29a2c-fd3b-4e5c-bd1b-7c821808a277.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebe29a2c-fd3b-4e5c-bd1b-7c821808a277.labels" -}}
helm.sh/chart: {{ include "go-echoebe29a2c-fd3b-4e5c-bd1b-7c821808a277.chart" . }}
{{ include "go-echoebe29a2c-fd3b-4e5c-bd1b-7c821808a277.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebe29a2c-fd3b-4e5c-bd1b-7c821808a277.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebe29a2c-fd3b-4e5c-bd1b-7c821808a277.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
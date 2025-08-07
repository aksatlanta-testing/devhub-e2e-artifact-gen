
{{- define "go-echobecbd9f1-1552-422b-8fff-84da6dd4e357.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobecbd9f1-1552-422b-8fff-84da6dd4e357.fullname" -}}
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


{{- define "go-echobecbd9f1-1552-422b-8fff-84da6dd4e357.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobecbd9f1-1552-422b-8fff-84da6dd4e357.labels" -}}
helm.sh/chart: {{ include "go-echobecbd9f1-1552-422b-8fff-84da6dd4e357.chart" . }}
{{ include "go-echobecbd9f1-1552-422b-8fff-84da6dd4e357.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobecbd9f1-1552-422b-8fff-84da6dd4e357.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobecbd9f1-1552-422b-8fff-84da6dd4e357.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
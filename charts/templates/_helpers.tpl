
{{- define "go-echoaaf2fc85-f17f-4023-abac-3ce553104e4e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaaf2fc85-f17f-4023-abac-3ce553104e4e.fullname" -}}
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


{{- define "go-echoaaf2fc85-f17f-4023-abac-3ce553104e4e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaaf2fc85-f17f-4023-abac-3ce553104e4e.labels" -}}
helm.sh/chart: {{ include "go-echoaaf2fc85-f17f-4023-abac-3ce553104e4e.chart" . }}
{{ include "go-echoaaf2fc85-f17f-4023-abac-3ce553104e4e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaaf2fc85-f17f-4023-abac-3ce553104e4e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaaf2fc85-f17f-4023-abac-3ce553104e4e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo6ebeb90f-5eb3-4b7c-ab90-77531995e360.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ebeb90f-5eb3-4b7c-ab90-77531995e360.fullname" -}}
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


{{- define "go-echo6ebeb90f-5eb3-4b7c-ab90-77531995e360.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ebeb90f-5eb3-4b7c-ab90-77531995e360.labels" -}}
helm.sh/chart: {{ include "go-echo6ebeb90f-5eb3-4b7c-ab90-77531995e360.chart" . }}
{{ include "go-echo6ebeb90f-5eb3-4b7c-ab90-77531995e360.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6ebeb90f-5eb3-4b7c-ab90-77531995e360.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6ebeb90f-5eb3-4b7c-ab90-77531995e360.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
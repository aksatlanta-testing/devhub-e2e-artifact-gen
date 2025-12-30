
{{- define "go-echoa44b2816-6ce4-454c-9618-5efc84a0160a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa44b2816-6ce4-454c-9618-5efc84a0160a.fullname" -}}
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


{{- define "go-echoa44b2816-6ce4-454c-9618-5efc84a0160a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa44b2816-6ce4-454c-9618-5efc84a0160a.labels" -}}
helm.sh/chart: {{ include "go-echoa44b2816-6ce4-454c-9618-5efc84a0160a.chart" . }}
{{ include "go-echoa44b2816-6ce4-454c-9618-5efc84a0160a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa44b2816-6ce4-454c-9618-5efc84a0160a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa44b2816-6ce4-454c-9618-5efc84a0160a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
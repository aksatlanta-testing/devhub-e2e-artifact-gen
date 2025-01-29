
{{- define "go-echoa29263e0-fce1-4ed6-be11-9d20077c0bac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa29263e0-fce1-4ed6-be11-9d20077c0bac.fullname" -}}
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


{{- define "go-echoa29263e0-fce1-4ed6-be11-9d20077c0bac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa29263e0-fce1-4ed6-be11-9d20077c0bac.labels" -}}
helm.sh/chart: {{ include "go-echoa29263e0-fce1-4ed6-be11-9d20077c0bac.chart" . }}
{{ include "go-echoa29263e0-fce1-4ed6-be11-9d20077c0bac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa29263e0-fce1-4ed6-be11-9d20077c0bac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa29263e0-fce1-4ed6-be11-9d20077c0bac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
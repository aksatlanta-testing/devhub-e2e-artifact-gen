
{{- define "go-echofdf20c84-23e1-48b8-8917-99fe961a524d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofdf20c84-23e1-48b8-8917-99fe961a524d.fullname" -}}
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


{{- define "go-echofdf20c84-23e1-48b8-8917-99fe961a524d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofdf20c84-23e1-48b8-8917-99fe961a524d.labels" -}}
helm.sh/chart: {{ include "go-echofdf20c84-23e1-48b8-8917-99fe961a524d.chart" . }}
{{ include "go-echofdf20c84-23e1-48b8-8917-99fe961a524d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofdf20c84-23e1-48b8-8917-99fe961a524d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofdf20c84-23e1-48b8-8917-99fe961a524d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
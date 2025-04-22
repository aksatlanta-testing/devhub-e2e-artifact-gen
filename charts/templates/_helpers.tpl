
{{- define "go-echo94c8256c-2c2c-4984-8fcc-399ce4c3bb77.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94c8256c-2c2c-4984-8fcc-399ce4c3bb77.fullname" -}}
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


{{- define "go-echo94c8256c-2c2c-4984-8fcc-399ce4c3bb77.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo94c8256c-2c2c-4984-8fcc-399ce4c3bb77.labels" -}}
helm.sh/chart: {{ include "go-echo94c8256c-2c2c-4984-8fcc-399ce4c3bb77.chart" . }}
{{ include "go-echo94c8256c-2c2c-4984-8fcc-399ce4c3bb77.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo94c8256c-2c2c-4984-8fcc-399ce4c3bb77.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo94c8256c-2c2c-4984-8fcc-399ce4c3bb77.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
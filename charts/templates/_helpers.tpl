
{{- define "go-echo41180fb7-680b-4751-849a-93b6331a224c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41180fb7-680b-4751-849a-93b6331a224c.fullname" -}}
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


{{- define "go-echo41180fb7-680b-4751-849a-93b6331a224c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo41180fb7-680b-4751-849a-93b6331a224c.labels" -}}
helm.sh/chart: {{ include "go-echo41180fb7-680b-4751-849a-93b6331a224c.chart" . }}
{{ include "go-echo41180fb7-680b-4751-849a-93b6331a224c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo41180fb7-680b-4751-849a-93b6331a224c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo41180fb7-680b-4751-849a-93b6331a224c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
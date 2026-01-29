
{{- define "go-echo34b501f9-0ea4-4702-9cf7-a27cb1b7b2ed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo34b501f9-0ea4-4702-9cf7-a27cb1b7b2ed.fullname" -}}
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


{{- define "go-echo34b501f9-0ea4-4702-9cf7-a27cb1b7b2ed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo34b501f9-0ea4-4702-9cf7-a27cb1b7b2ed.labels" -}}
helm.sh/chart: {{ include "go-echo34b501f9-0ea4-4702-9cf7-a27cb1b7b2ed.chart" . }}
{{ include "go-echo34b501f9-0ea4-4702-9cf7-a27cb1b7b2ed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo34b501f9-0ea4-4702-9cf7-a27cb1b7b2ed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo34b501f9-0ea4-4702-9cf7-a27cb1b7b2ed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
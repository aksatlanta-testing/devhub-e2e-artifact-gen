
{{- define "go-echo7ea21c2b-4796-4b90-809b-4b3908e38245.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ea21c2b-4796-4b90-809b-4b3908e38245.fullname" -}}
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


{{- define "go-echo7ea21c2b-4796-4b90-809b-4b3908e38245.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7ea21c2b-4796-4b90-809b-4b3908e38245.labels" -}}
helm.sh/chart: {{ include "go-echo7ea21c2b-4796-4b90-809b-4b3908e38245.chart" . }}
{{ include "go-echo7ea21c2b-4796-4b90-809b-4b3908e38245.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7ea21c2b-4796-4b90-809b-4b3908e38245.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7ea21c2b-4796-4b90-809b-4b3908e38245.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo25c0504a-233d-40da-a287-051695447d39.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo25c0504a-233d-40da-a287-051695447d39.fullname" -}}
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


{{- define "go-echo25c0504a-233d-40da-a287-051695447d39.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo25c0504a-233d-40da-a287-051695447d39.labels" -}}
helm.sh/chart: {{ include "go-echo25c0504a-233d-40da-a287-051695447d39.chart" . }}
{{ include "go-echo25c0504a-233d-40da-a287-051695447d39.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo25c0504a-233d-40da-a287-051695447d39.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo25c0504a-233d-40da-a287-051695447d39.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo3074b4bb-ca2a-4d38-ae10-7624bf3c6386.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3074b4bb-ca2a-4d38-ae10-7624bf3c6386.fullname" -}}
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


{{- define "go-echo3074b4bb-ca2a-4d38-ae10-7624bf3c6386.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3074b4bb-ca2a-4d38-ae10-7624bf3c6386.labels" -}}
helm.sh/chart: {{ include "go-echo3074b4bb-ca2a-4d38-ae10-7624bf3c6386.chart" . }}
{{ include "go-echo3074b4bb-ca2a-4d38-ae10-7624bf3c6386.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3074b4bb-ca2a-4d38-ae10-7624bf3c6386.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3074b4bb-ca2a-4d38-ae10-7624bf3c6386.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
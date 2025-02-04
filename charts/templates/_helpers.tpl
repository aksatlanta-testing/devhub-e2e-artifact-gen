
{{- define "go-echo895bdb7d-dd6d-41a1-946e-028ce5d03acb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo895bdb7d-dd6d-41a1-946e-028ce5d03acb.fullname" -}}
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


{{- define "go-echo895bdb7d-dd6d-41a1-946e-028ce5d03acb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo895bdb7d-dd6d-41a1-946e-028ce5d03acb.labels" -}}
helm.sh/chart: {{ include "go-echo895bdb7d-dd6d-41a1-946e-028ce5d03acb.chart" . }}
{{ include "go-echo895bdb7d-dd6d-41a1-946e-028ce5d03acb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo895bdb7d-dd6d-41a1-946e-028ce5d03acb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo895bdb7d-dd6d-41a1-946e-028ce5d03acb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
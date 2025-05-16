
{{- define "go-echo561ae720-3660-4eb5-9f61-56f240b8bbed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo561ae720-3660-4eb5-9f61-56f240b8bbed.fullname" -}}
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


{{- define "go-echo561ae720-3660-4eb5-9f61-56f240b8bbed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo561ae720-3660-4eb5-9f61-56f240b8bbed.labels" -}}
helm.sh/chart: {{ include "go-echo561ae720-3660-4eb5-9f61-56f240b8bbed.chart" . }}
{{ include "go-echo561ae720-3660-4eb5-9f61-56f240b8bbed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo561ae720-3660-4eb5-9f61-56f240b8bbed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo561ae720-3660-4eb5-9f61-56f240b8bbed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
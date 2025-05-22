
{{- define "go-echo12bb49be-5d01-4022-80ad-c6751d0a1b82.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12bb49be-5d01-4022-80ad-c6751d0a1b82.fullname" -}}
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


{{- define "go-echo12bb49be-5d01-4022-80ad-c6751d0a1b82.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo12bb49be-5d01-4022-80ad-c6751d0a1b82.labels" -}}
helm.sh/chart: {{ include "go-echo12bb49be-5d01-4022-80ad-c6751d0a1b82.chart" . }}
{{ include "go-echo12bb49be-5d01-4022-80ad-c6751d0a1b82.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo12bb49be-5d01-4022-80ad-c6751d0a1b82.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo12bb49be-5d01-4022-80ad-c6751d0a1b82.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
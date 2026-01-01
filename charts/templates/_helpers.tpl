
{{- define "go-echobef7f669-81cd-4bad-8fc0-9898f9d652cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobef7f669-81cd-4bad-8fc0-9898f9d652cf.fullname" -}}
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


{{- define "go-echobef7f669-81cd-4bad-8fc0-9898f9d652cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobef7f669-81cd-4bad-8fc0-9898f9d652cf.labels" -}}
helm.sh/chart: {{ include "go-echobef7f669-81cd-4bad-8fc0-9898f9d652cf.chart" . }}
{{ include "go-echobef7f669-81cd-4bad-8fc0-9898f9d652cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobef7f669-81cd-4bad-8fc0-9898f9d652cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobef7f669-81cd-4bad-8fc0-9898f9d652cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
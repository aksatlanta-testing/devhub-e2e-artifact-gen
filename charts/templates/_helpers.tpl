
{{- define "go-echoa4593966-6593-4b1d-89c4-d053c285646e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4593966-6593-4b1d-89c4-d053c285646e.fullname" -}}
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


{{- define "go-echoa4593966-6593-4b1d-89c4-d053c285646e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4593966-6593-4b1d-89c4-d053c285646e.labels" -}}
helm.sh/chart: {{ include "go-echoa4593966-6593-4b1d-89c4-d053c285646e.chart" . }}
{{ include "go-echoa4593966-6593-4b1d-89c4-d053c285646e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4593966-6593-4b1d-89c4-d053c285646e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4593966-6593-4b1d-89c4-d053c285646e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
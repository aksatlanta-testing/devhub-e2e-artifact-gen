
{{- define "go-echo3129297e-06f7-432d-b601-a4504be8d624.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3129297e-06f7-432d-b601-a4504be8d624.fullname" -}}
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


{{- define "go-echo3129297e-06f7-432d-b601-a4504be8d624.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3129297e-06f7-432d-b601-a4504be8d624.labels" -}}
helm.sh/chart: {{ include "go-echo3129297e-06f7-432d-b601-a4504be8d624.chart" . }}
{{ include "go-echo3129297e-06f7-432d-b601-a4504be8d624.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3129297e-06f7-432d-b601-a4504be8d624.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3129297e-06f7-432d-b601-a4504be8d624.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo3ad15c7d-42ef-478e-98d7-093256b7dce9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ad15c7d-42ef-478e-98d7-093256b7dce9.fullname" -}}
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


{{- define "go-echo3ad15c7d-42ef-478e-98d7-093256b7dce9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3ad15c7d-42ef-478e-98d7-093256b7dce9.labels" -}}
helm.sh/chart: {{ include "go-echo3ad15c7d-42ef-478e-98d7-093256b7dce9.chart" . }}
{{ include "go-echo3ad15c7d-42ef-478e-98d7-093256b7dce9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3ad15c7d-42ef-478e-98d7-093256b7dce9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3ad15c7d-42ef-478e-98d7-093256b7dce9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
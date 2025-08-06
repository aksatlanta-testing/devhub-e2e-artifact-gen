
{{- define "go-echodf267d13-1060-42ec-b57e-720ebc042847.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf267d13-1060-42ec-b57e-720ebc042847.fullname" -}}
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


{{- define "go-echodf267d13-1060-42ec-b57e-720ebc042847.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf267d13-1060-42ec-b57e-720ebc042847.labels" -}}
helm.sh/chart: {{ include "go-echodf267d13-1060-42ec-b57e-720ebc042847.chart" . }}
{{ include "go-echodf267d13-1060-42ec-b57e-720ebc042847.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf267d13-1060-42ec-b57e-720ebc042847.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf267d13-1060-42ec-b57e-720ebc042847.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
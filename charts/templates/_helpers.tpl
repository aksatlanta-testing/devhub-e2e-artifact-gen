
{{- define "go-echoa05f8a61-ed5f-47fa-998c-6b8c4e3d7098.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa05f8a61-ed5f-47fa-998c-6b8c4e3d7098.fullname" -}}
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


{{- define "go-echoa05f8a61-ed5f-47fa-998c-6b8c4e3d7098.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa05f8a61-ed5f-47fa-998c-6b8c4e3d7098.labels" -}}
helm.sh/chart: {{ include "go-echoa05f8a61-ed5f-47fa-998c-6b8c4e3d7098.chart" . }}
{{ include "go-echoa05f8a61-ed5f-47fa-998c-6b8c4e3d7098.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa05f8a61-ed5f-47fa-998c-6b8c4e3d7098.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa05f8a61-ed5f-47fa-998c-6b8c4e3d7098.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
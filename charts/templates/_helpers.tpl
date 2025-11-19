
{{- define "go-echoe1126059-44f6-4ce8-99c7-19f7bebc3dbd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1126059-44f6-4ce8-99c7-19f7bebc3dbd.fullname" -}}
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


{{- define "go-echoe1126059-44f6-4ce8-99c7-19f7bebc3dbd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe1126059-44f6-4ce8-99c7-19f7bebc3dbd.labels" -}}
helm.sh/chart: {{ include "go-echoe1126059-44f6-4ce8-99c7-19f7bebc3dbd.chart" . }}
{{ include "go-echoe1126059-44f6-4ce8-99c7-19f7bebc3dbd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe1126059-44f6-4ce8-99c7-19f7bebc3dbd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe1126059-44f6-4ce8-99c7-19f7bebc3dbd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
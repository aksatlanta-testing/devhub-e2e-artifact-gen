
{{- define "go-echof5b0be05-d6e8-4a8d-9329-430a00dbcbca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5b0be05-d6e8-4a8d-9329-430a00dbcbca.fullname" -}}
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


{{- define "go-echof5b0be05-d6e8-4a8d-9329-430a00dbcbca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof5b0be05-d6e8-4a8d-9329-430a00dbcbca.labels" -}}
helm.sh/chart: {{ include "go-echof5b0be05-d6e8-4a8d-9329-430a00dbcbca.chart" . }}
{{ include "go-echof5b0be05-d6e8-4a8d-9329-430a00dbcbca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof5b0be05-d6e8-4a8d-9329-430a00dbcbca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof5b0be05-d6e8-4a8d-9329-430a00dbcbca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoad045e8d-91b8-45f9-95d7-d64063fd948d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad045e8d-91b8-45f9-95d7-d64063fd948d.fullname" -}}
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


{{- define "go-echoad045e8d-91b8-45f9-95d7-d64063fd948d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoad045e8d-91b8-45f9-95d7-d64063fd948d.labels" -}}
helm.sh/chart: {{ include "go-echoad045e8d-91b8-45f9-95d7-d64063fd948d.chart" . }}
{{ include "go-echoad045e8d-91b8-45f9-95d7-d64063fd948d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoad045e8d-91b8-45f9-95d7-d64063fd948d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoad045e8d-91b8-45f9-95d7-d64063fd948d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo572dc6c3-81c9-40e6-b090-473d7641d364.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo572dc6c3-81c9-40e6-b090-473d7641d364.fullname" -}}
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


{{- define "go-echo572dc6c3-81c9-40e6-b090-473d7641d364.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo572dc6c3-81c9-40e6-b090-473d7641d364.labels" -}}
helm.sh/chart: {{ include "go-echo572dc6c3-81c9-40e6-b090-473d7641d364.chart" . }}
{{ include "go-echo572dc6c3-81c9-40e6-b090-473d7641d364.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo572dc6c3-81c9-40e6-b090-473d7641d364.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo572dc6c3-81c9-40e6-b090-473d7641d364.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
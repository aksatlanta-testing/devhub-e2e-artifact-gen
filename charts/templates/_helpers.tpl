
{{- define "go-echobb0142ee-9ff6-4498-8747-658fc181f4fe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb0142ee-9ff6-4498-8747-658fc181f4fe.fullname" -}}
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


{{- define "go-echobb0142ee-9ff6-4498-8747-658fc181f4fe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobb0142ee-9ff6-4498-8747-658fc181f4fe.labels" -}}
helm.sh/chart: {{ include "go-echobb0142ee-9ff6-4498-8747-658fc181f4fe.chart" . }}
{{ include "go-echobb0142ee-9ff6-4498-8747-658fc181f4fe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobb0142ee-9ff6-4498-8747-658fc181f4fe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobb0142ee-9ff6-4498-8747-658fc181f4fe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
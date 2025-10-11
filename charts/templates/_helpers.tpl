
{{- define "go-echo9330d10e-b8d6-46ef-b348-15dbc1e38464.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9330d10e-b8d6-46ef-b348-15dbc1e38464.fullname" -}}
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


{{- define "go-echo9330d10e-b8d6-46ef-b348-15dbc1e38464.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9330d10e-b8d6-46ef-b348-15dbc1e38464.labels" -}}
helm.sh/chart: {{ include "go-echo9330d10e-b8d6-46ef-b348-15dbc1e38464.chart" . }}
{{ include "go-echo9330d10e-b8d6-46ef-b348-15dbc1e38464.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9330d10e-b8d6-46ef-b348-15dbc1e38464.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9330d10e-b8d6-46ef-b348-15dbc1e38464.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo9c719cf8-ed68-4c05-b3db-cc29f974983f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c719cf8-ed68-4c05-b3db-cc29f974983f.fullname" -}}
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


{{- define "go-echo9c719cf8-ed68-4c05-b3db-cc29f974983f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c719cf8-ed68-4c05-b3db-cc29f974983f.labels" -}}
helm.sh/chart: {{ include "go-echo9c719cf8-ed68-4c05-b3db-cc29f974983f.chart" . }}
{{ include "go-echo9c719cf8-ed68-4c05-b3db-cc29f974983f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9c719cf8-ed68-4c05-b3db-cc29f974983f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9c719cf8-ed68-4c05-b3db-cc29f974983f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
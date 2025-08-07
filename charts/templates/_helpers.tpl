
{{- define "go-echo8736d74b-e11a-40a2-a19b-844779f318bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8736d74b-e11a-40a2-a19b-844779f318bc.fullname" -}}
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


{{- define "go-echo8736d74b-e11a-40a2-a19b-844779f318bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8736d74b-e11a-40a2-a19b-844779f318bc.labels" -}}
helm.sh/chart: {{ include "go-echo8736d74b-e11a-40a2-a19b-844779f318bc.chart" . }}
{{ include "go-echo8736d74b-e11a-40a2-a19b-844779f318bc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8736d74b-e11a-40a2-a19b-844779f318bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8736d74b-e11a-40a2-a19b-844779f318bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
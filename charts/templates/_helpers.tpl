
{{- define "go-echo9648c08c-dc5b-4dfb-b764-93301fa95afe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9648c08c-dc5b-4dfb-b764-93301fa95afe.fullname" -}}
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


{{- define "go-echo9648c08c-dc5b-4dfb-b764-93301fa95afe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9648c08c-dc5b-4dfb-b764-93301fa95afe.labels" -}}
helm.sh/chart: {{ include "go-echo9648c08c-dc5b-4dfb-b764-93301fa95afe.chart" . }}
{{ include "go-echo9648c08c-dc5b-4dfb-b764-93301fa95afe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9648c08c-dc5b-4dfb-b764-93301fa95afe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9648c08c-dc5b-4dfb-b764-93301fa95afe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
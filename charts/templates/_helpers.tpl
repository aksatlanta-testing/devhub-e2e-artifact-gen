
{{- define "go-echof21300ec-e19a-4094-b0df-22759c7fc93c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof21300ec-e19a-4094-b0df-22759c7fc93c.fullname" -}}
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


{{- define "go-echof21300ec-e19a-4094-b0df-22759c7fc93c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof21300ec-e19a-4094-b0df-22759c7fc93c.labels" -}}
helm.sh/chart: {{ include "go-echof21300ec-e19a-4094-b0df-22759c7fc93c.chart" . }}
{{ include "go-echof21300ec-e19a-4094-b0df-22759c7fc93c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof21300ec-e19a-4094-b0df-22759c7fc93c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof21300ec-e19a-4094-b0df-22759c7fc93c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
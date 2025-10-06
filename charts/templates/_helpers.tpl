
{{- define "go-echoa3eb723f-60b7-48d8-b03e-96a10675965b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3eb723f-60b7-48d8-b03e-96a10675965b.fullname" -}}
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


{{- define "go-echoa3eb723f-60b7-48d8-b03e-96a10675965b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3eb723f-60b7-48d8-b03e-96a10675965b.labels" -}}
helm.sh/chart: {{ include "go-echoa3eb723f-60b7-48d8-b03e-96a10675965b.chart" . }}
{{ include "go-echoa3eb723f-60b7-48d8-b03e-96a10675965b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3eb723f-60b7-48d8-b03e-96a10675965b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3eb723f-60b7-48d8-b03e-96a10675965b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
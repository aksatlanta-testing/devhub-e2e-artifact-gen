
{{- define "go-echo936a91f1-b570-4aab-8ccc-e88c42cee595.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo936a91f1-b570-4aab-8ccc-e88c42cee595.fullname" -}}
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


{{- define "go-echo936a91f1-b570-4aab-8ccc-e88c42cee595.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo936a91f1-b570-4aab-8ccc-e88c42cee595.labels" -}}
helm.sh/chart: {{ include "go-echo936a91f1-b570-4aab-8ccc-e88c42cee595.chart" . }}
{{ include "go-echo936a91f1-b570-4aab-8ccc-e88c42cee595.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo936a91f1-b570-4aab-8ccc-e88c42cee595.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo936a91f1-b570-4aab-8ccc-e88c42cee595.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
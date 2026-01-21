
{{- define "go-echof6105bd6-884b-4c8e-a91a-f099b5912b78.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6105bd6-884b-4c8e-a91a-f099b5912b78.fullname" -}}
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


{{- define "go-echof6105bd6-884b-4c8e-a91a-f099b5912b78.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof6105bd6-884b-4c8e-a91a-f099b5912b78.labels" -}}
helm.sh/chart: {{ include "go-echof6105bd6-884b-4c8e-a91a-f099b5912b78.chart" . }}
{{ include "go-echof6105bd6-884b-4c8e-a91a-f099b5912b78.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof6105bd6-884b-4c8e-a91a-f099b5912b78.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof6105bd6-884b-4c8e-a91a-f099b5912b78.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
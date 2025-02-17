
{{- define "go-echofc2b98df-838f-4107-b8ec-4fdf654a91bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc2b98df-838f-4107-b8ec-4fdf654a91bf.fullname" -}}
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


{{- define "go-echofc2b98df-838f-4107-b8ec-4fdf654a91bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc2b98df-838f-4107-b8ec-4fdf654a91bf.labels" -}}
helm.sh/chart: {{ include "go-echofc2b98df-838f-4107-b8ec-4fdf654a91bf.chart" . }}
{{ include "go-echofc2b98df-838f-4107-b8ec-4fdf654a91bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc2b98df-838f-4107-b8ec-4fdf654a91bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc2b98df-838f-4107-b8ec-4fdf654a91bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
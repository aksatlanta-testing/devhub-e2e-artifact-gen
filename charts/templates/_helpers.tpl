
{{- define "go-echob07e98d6-c7bd-4ec7-9c7a-c12edabe798e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob07e98d6-c7bd-4ec7-9c7a-c12edabe798e.fullname" -}}
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


{{- define "go-echob07e98d6-c7bd-4ec7-9c7a-c12edabe798e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob07e98d6-c7bd-4ec7-9c7a-c12edabe798e.labels" -}}
helm.sh/chart: {{ include "go-echob07e98d6-c7bd-4ec7-9c7a-c12edabe798e.chart" . }}
{{ include "go-echob07e98d6-c7bd-4ec7-9c7a-c12edabe798e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob07e98d6-c7bd-4ec7-9c7a-c12edabe798e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob07e98d6-c7bd-4ec7-9c7a-c12edabe798e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
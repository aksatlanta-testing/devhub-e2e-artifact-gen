
{{- define "go-echo767c2efe-8e2d-4671-a304-387cdec822dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo767c2efe-8e2d-4671-a304-387cdec822dc.fullname" -}}
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


{{- define "go-echo767c2efe-8e2d-4671-a304-387cdec822dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo767c2efe-8e2d-4671-a304-387cdec822dc.labels" -}}
helm.sh/chart: {{ include "go-echo767c2efe-8e2d-4671-a304-387cdec822dc.chart" . }}
{{ include "go-echo767c2efe-8e2d-4671-a304-387cdec822dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo767c2efe-8e2d-4671-a304-387cdec822dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo767c2efe-8e2d-4671-a304-387cdec822dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echof2d238f5-0353-447f-8a7b-df3406846216.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2d238f5-0353-447f-8a7b-df3406846216.fullname" -}}
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


{{- define "go-echof2d238f5-0353-447f-8a7b-df3406846216.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2d238f5-0353-447f-8a7b-df3406846216.labels" -}}
helm.sh/chart: {{ include "go-echof2d238f5-0353-447f-8a7b-df3406846216.chart" . }}
{{ include "go-echof2d238f5-0353-447f-8a7b-df3406846216.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2d238f5-0353-447f-8a7b-df3406846216.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2d238f5-0353-447f-8a7b-df3406846216.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echof2ccb1d7-5500-4d4c-8604-609c29f98402.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2ccb1d7-5500-4d4c-8604-609c29f98402.fullname" -}}
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


{{- define "go-echof2ccb1d7-5500-4d4c-8604-609c29f98402.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2ccb1d7-5500-4d4c-8604-609c29f98402.labels" -}}
helm.sh/chart: {{ include "go-echof2ccb1d7-5500-4d4c-8604-609c29f98402.chart" . }}
{{ include "go-echof2ccb1d7-5500-4d4c-8604-609c29f98402.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2ccb1d7-5500-4d4c-8604-609c29f98402.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2ccb1d7-5500-4d4c-8604-609c29f98402.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
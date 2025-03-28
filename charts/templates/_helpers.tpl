
{{- define "go-echoc1dc8dac-9b11-41dc-8805-adb73342d22b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1dc8dac-9b11-41dc-8805-adb73342d22b.fullname" -}}
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


{{- define "go-echoc1dc8dac-9b11-41dc-8805-adb73342d22b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1dc8dac-9b11-41dc-8805-adb73342d22b.labels" -}}
helm.sh/chart: {{ include "go-echoc1dc8dac-9b11-41dc-8805-adb73342d22b.chart" . }}
{{ include "go-echoc1dc8dac-9b11-41dc-8805-adb73342d22b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1dc8dac-9b11-41dc-8805-adb73342d22b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1dc8dac-9b11-41dc-8805-adb73342d22b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
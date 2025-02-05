
{{- define "go-echofeeda93b-53c6-472a-90c5-f3955dad2aea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofeeda93b-53c6-472a-90c5-f3955dad2aea.fullname" -}}
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


{{- define "go-echofeeda93b-53c6-472a-90c5-f3955dad2aea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofeeda93b-53c6-472a-90c5-f3955dad2aea.labels" -}}
helm.sh/chart: {{ include "go-echofeeda93b-53c6-472a-90c5-f3955dad2aea.chart" . }}
{{ include "go-echofeeda93b-53c6-472a-90c5-f3955dad2aea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofeeda93b-53c6-472a-90c5-f3955dad2aea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofeeda93b-53c6-472a-90c5-f3955dad2aea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
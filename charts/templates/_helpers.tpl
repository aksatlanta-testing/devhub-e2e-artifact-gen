
{{- define "go-echod43690a9-1a7a-49da-98ed-0a1306b83555.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod43690a9-1a7a-49da-98ed-0a1306b83555.fullname" -}}
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


{{- define "go-echod43690a9-1a7a-49da-98ed-0a1306b83555.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod43690a9-1a7a-49da-98ed-0a1306b83555.labels" -}}
helm.sh/chart: {{ include "go-echod43690a9-1a7a-49da-98ed-0a1306b83555.chart" . }}
{{ include "go-echod43690a9-1a7a-49da-98ed-0a1306b83555.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod43690a9-1a7a-49da-98ed-0a1306b83555.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod43690a9-1a7a-49da-98ed-0a1306b83555.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
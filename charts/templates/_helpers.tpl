
{{- define "go-echo9c1f8350-8b0d-4cab-a825-f3c1c6889bcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c1f8350-8b0d-4cab-a825-f3c1c6889bcd.fullname" -}}
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


{{- define "go-echo9c1f8350-8b0d-4cab-a825-f3c1c6889bcd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c1f8350-8b0d-4cab-a825-f3c1c6889bcd.labels" -}}
helm.sh/chart: {{ include "go-echo9c1f8350-8b0d-4cab-a825-f3c1c6889bcd.chart" . }}
{{ include "go-echo9c1f8350-8b0d-4cab-a825-f3c1c6889bcd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9c1f8350-8b0d-4cab-a825-f3c1c6889bcd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9c1f8350-8b0d-4cab-a825-f3c1c6889bcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
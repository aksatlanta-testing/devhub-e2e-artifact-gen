
{{- define "go-echo06e8bd8a-093a-4de0-b0b3-b84f8f857454.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06e8bd8a-093a-4de0-b0b3-b84f8f857454.fullname" -}}
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


{{- define "go-echo06e8bd8a-093a-4de0-b0b3-b84f8f857454.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo06e8bd8a-093a-4de0-b0b3-b84f8f857454.labels" -}}
helm.sh/chart: {{ include "go-echo06e8bd8a-093a-4de0-b0b3-b84f8f857454.chart" . }}
{{ include "go-echo06e8bd8a-093a-4de0-b0b3-b84f8f857454.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo06e8bd8a-093a-4de0-b0b3-b84f8f857454.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo06e8bd8a-093a-4de0-b0b3-b84f8f857454.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo77f84823-23b0-4d4c-9dca-8b44cff97100.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77f84823-23b0-4d4c-9dca-8b44cff97100.fullname" -}}
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


{{- define "go-echo77f84823-23b0-4d4c-9dca-8b44cff97100.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo77f84823-23b0-4d4c-9dca-8b44cff97100.labels" -}}
helm.sh/chart: {{ include "go-echo77f84823-23b0-4d4c-9dca-8b44cff97100.chart" . }}
{{ include "go-echo77f84823-23b0-4d4c-9dca-8b44cff97100.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo77f84823-23b0-4d4c-9dca-8b44cff97100.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo77f84823-23b0-4d4c-9dca-8b44cff97100.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
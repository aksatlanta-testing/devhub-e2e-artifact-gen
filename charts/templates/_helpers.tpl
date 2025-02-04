
{{- define "go-echo2ec68bc4-1372-4a84-9cd4-951c9773e7cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2ec68bc4-1372-4a84-9cd4-951c9773e7cd.fullname" -}}
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


{{- define "go-echo2ec68bc4-1372-4a84-9cd4-951c9773e7cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2ec68bc4-1372-4a84-9cd4-951c9773e7cd.labels" -}}
helm.sh/chart: {{ include "go-echo2ec68bc4-1372-4a84-9cd4-951c9773e7cd.chart" . }}
{{ include "go-echo2ec68bc4-1372-4a84-9cd4-951c9773e7cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2ec68bc4-1372-4a84-9cd4-951c9773e7cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2ec68bc4-1372-4a84-9cd4-951c9773e7cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
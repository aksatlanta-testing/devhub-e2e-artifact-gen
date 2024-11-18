
{{- define "go-echod1935918-3231-43f1-ac91-8dde3b782da1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1935918-3231-43f1-ac91-8dde3b782da1.fullname" -}}
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


{{- define "go-echod1935918-3231-43f1-ac91-8dde3b782da1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1935918-3231-43f1-ac91-8dde3b782da1.labels" -}}
helm.sh/chart: {{ include "go-echod1935918-3231-43f1-ac91-8dde3b782da1.chart" . }}
{{ include "go-echod1935918-3231-43f1-ac91-8dde3b782da1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1935918-3231-43f1-ac91-8dde3b782da1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1935918-3231-43f1-ac91-8dde3b782da1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
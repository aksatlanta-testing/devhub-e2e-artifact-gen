
{{- define "go-echoac39ddec-7e70-42de-bdf4-c993686ce764.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac39ddec-7e70-42de-bdf4-c993686ce764.fullname" -}}
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


{{- define "go-echoac39ddec-7e70-42de-bdf4-c993686ce764.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac39ddec-7e70-42de-bdf4-c993686ce764.labels" -}}
helm.sh/chart: {{ include "go-echoac39ddec-7e70-42de-bdf4-c993686ce764.chart" . }}
{{ include "go-echoac39ddec-7e70-42de-bdf4-c993686ce764.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac39ddec-7e70-42de-bdf4-c993686ce764.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac39ddec-7e70-42de-bdf4-c993686ce764.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
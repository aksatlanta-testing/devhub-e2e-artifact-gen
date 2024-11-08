
{{- define "go-echo2637ce79-8b82-49fe-b6fa-8f5e8009df87.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2637ce79-8b82-49fe-b6fa-8f5e8009df87.fullname" -}}
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


{{- define "go-echo2637ce79-8b82-49fe-b6fa-8f5e8009df87.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2637ce79-8b82-49fe-b6fa-8f5e8009df87.labels" -}}
helm.sh/chart: {{ include "go-echo2637ce79-8b82-49fe-b6fa-8f5e8009df87.chart" . }}
{{ include "go-echo2637ce79-8b82-49fe-b6fa-8f5e8009df87.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2637ce79-8b82-49fe-b6fa-8f5e8009df87.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2637ce79-8b82-49fe-b6fa-8f5e8009df87.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
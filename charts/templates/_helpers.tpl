
{{- define "go-echodf41a6ca-80a2-4ce3-813f-1b638b0fe96c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf41a6ca-80a2-4ce3-813f-1b638b0fe96c.fullname" -}}
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


{{- define "go-echodf41a6ca-80a2-4ce3-813f-1b638b0fe96c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf41a6ca-80a2-4ce3-813f-1b638b0fe96c.labels" -}}
helm.sh/chart: {{ include "go-echodf41a6ca-80a2-4ce3-813f-1b638b0fe96c.chart" . }}
{{ include "go-echodf41a6ca-80a2-4ce3-813f-1b638b0fe96c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf41a6ca-80a2-4ce3-813f-1b638b0fe96c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf41a6ca-80a2-4ce3-813f-1b638b0fe96c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
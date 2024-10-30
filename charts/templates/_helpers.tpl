
{{- define "go-echo6ac84b1e-1b04-46cc-8b25-4ba3a324b81c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ac84b1e-1b04-46cc-8b25-4ba3a324b81c.fullname" -}}
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


{{- define "go-echo6ac84b1e-1b04-46cc-8b25-4ba3a324b81c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6ac84b1e-1b04-46cc-8b25-4ba3a324b81c.labels" -}}
helm.sh/chart: {{ include "go-echo6ac84b1e-1b04-46cc-8b25-4ba3a324b81c.chart" . }}
{{ include "go-echo6ac84b1e-1b04-46cc-8b25-4ba3a324b81c.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6ac84b1e-1b04-46cc-8b25-4ba3a324b81c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6ac84b1e-1b04-46cc-8b25-4ba3a324b81c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
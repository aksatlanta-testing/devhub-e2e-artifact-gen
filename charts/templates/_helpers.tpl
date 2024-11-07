
{{- define "go-echo8139536f-6efb-49a3-8336-5b8a8369823b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8139536f-6efb-49a3-8336-5b8a8369823b.fullname" -}}
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


{{- define "go-echo8139536f-6efb-49a3-8336-5b8a8369823b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8139536f-6efb-49a3-8336-5b8a8369823b.labels" -}}
helm.sh/chart: {{ include "go-echo8139536f-6efb-49a3-8336-5b8a8369823b.chart" . }}
{{ include "go-echo8139536f-6efb-49a3-8336-5b8a8369823b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8139536f-6efb-49a3-8336-5b8a8369823b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8139536f-6efb-49a3-8336-5b8a8369823b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
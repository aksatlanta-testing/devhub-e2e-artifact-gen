
{{- define "go-echo8cd78f39-0685-4321-bd13-c80b269ba18b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cd78f39-0685-4321-bd13-c80b269ba18b.fullname" -}}
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


{{- define "go-echo8cd78f39-0685-4321-bd13-c80b269ba18b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8cd78f39-0685-4321-bd13-c80b269ba18b.labels" -}}
helm.sh/chart: {{ include "go-echo8cd78f39-0685-4321-bd13-c80b269ba18b.chart" . }}
{{ include "go-echo8cd78f39-0685-4321-bd13-c80b269ba18b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8cd78f39-0685-4321-bd13-c80b269ba18b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8cd78f39-0685-4321-bd13-c80b269ba18b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
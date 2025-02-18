
{{- define "go-echof8e8d256-676e-4884-8f18-87e0ab4a863d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8e8d256-676e-4884-8f18-87e0ab4a863d.fullname" -}}
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


{{- define "go-echof8e8d256-676e-4884-8f18-87e0ab4a863d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8e8d256-676e-4884-8f18-87e0ab4a863d.labels" -}}
helm.sh/chart: {{ include "go-echof8e8d256-676e-4884-8f18-87e0ab4a863d.chart" . }}
{{ include "go-echof8e8d256-676e-4884-8f18-87e0ab4a863d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8e8d256-676e-4884-8f18-87e0ab4a863d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8e8d256-676e-4884-8f18-87e0ab4a863d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echod5b18d4e-3bfa-49d2-92e7-c0b4609cf7dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5b18d4e-3bfa-49d2-92e7-c0b4609cf7dc.fullname" -}}
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


{{- define "go-echod5b18d4e-3bfa-49d2-92e7-c0b4609cf7dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5b18d4e-3bfa-49d2-92e7-c0b4609cf7dc.labels" -}}
helm.sh/chart: {{ include "go-echod5b18d4e-3bfa-49d2-92e7-c0b4609cf7dc.chart" . }}
{{ include "go-echod5b18d4e-3bfa-49d2-92e7-c0b4609cf7dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5b18d4e-3bfa-49d2-92e7-c0b4609cf7dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5b18d4e-3bfa-49d2-92e7-c0b4609cf7dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
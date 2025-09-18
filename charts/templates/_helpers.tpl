
{{- define "go-echo398a2ff1-3a1c-4af0-ab36-dc2a4fae931b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo398a2ff1-3a1c-4af0-ab36-dc2a4fae931b.fullname" -}}
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


{{- define "go-echo398a2ff1-3a1c-4af0-ab36-dc2a4fae931b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo398a2ff1-3a1c-4af0-ab36-dc2a4fae931b.labels" -}}
helm.sh/chart: {{ include "go-echo398a2ff1-3a1c-4af0-ab36-dc2a4fae931b.chart" . }}
{{ include "go-echo398a2ff1-3a1c-4af0-ab36-dc2a4fae931b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo398a2ff1-3a1c-4af0-ab36-dc2a4fae931b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo398a2ff1-3a1c-4af0-ab36-dc2a4fae931b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo932a13b9-37b7-48bc-aae4-f9a1a102147d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo932a13b9-37b7-48bc-aae4-f9a1a102147d.fullname" -}}
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


{{- define "go-echo932a13b9-37b7-48bc-aae4-f9a1a102147d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo932a13b9-37b7-48bc-aae4-f9a1a102147d.labels" -}}
helm.sh/chart: {{ include "go-echo932a13b9-37b7-48bc-aae4-f9a1a102147d.chart" . }}
{{ include "go-echo932a13b9-37b7-48bc-aae4-f9a1a102147d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo932a13b9-37b7-48bc-aae4-f9a1a102147d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo932a13b9-37b7-48bc-aae4-f9a1a102147d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
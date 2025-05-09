
{{- define "go-echo49426d12-bb40-47cd-99a7-2482cb93d2fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49426d12-bb40-47cd-99a7-2482cb93d2fd.fullname" -}}
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


{{- define "go-echo49426d12-bb40-47cd-99a7-2482cb93d2fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49426d12-bb40-47cd-99a7-2482cb93d2fd.labels" -}}
helm.sh/chart: {{ include "go-echo49426d12-bb40-47cd-99a7-2482cb93d2fd.chart" . }}
{{ include "go-echo49426d12-bb40-47cd-99a7-2482cb93d2fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49426d12-bb40-47cd-99a7-2482cb93d2fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49426d12-bb40-47cd-99a7-2482cb93d2fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
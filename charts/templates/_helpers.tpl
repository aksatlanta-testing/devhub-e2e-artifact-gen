
{{- define "go-echo2c04da55-b382-4e77-8f99-7b46cf97ef94.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c04da55-b382-4e77-8f99-7b46cf97ef94.fullname" -}}
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


{{- define "go-echo2c04da55-b382-4e77-8f99-7b46cf97ef94.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2c04da55-b382-4e77-8f99-7b46cf97ef94.labels" -}}
helm.sh/chart: {{ include "go-echo2c04da55-b382-4e77-8f99-7b46cf97ef94.chart" . }}
{{ include "go-echo2c04da55-b382-4e77-8f99-7b46cf97ef94.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2c04da55-b382-4e77-8f99-7b46cf97ef94.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2c04da55-b382-4e77-8f99-7b46cf97ef94.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
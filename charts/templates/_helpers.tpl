
{{- define "go-echoe6f2b65a-edde-43c0-99a0-6e9fe430771d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6f2b65a-edde-43c0-99a0-6e9fe430771d.fullname" -}}
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


{{- define "go-echoe6f2b65a-edde-43c0-99a0-6e9fe430771d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6f2b65a-edde-43c0-99a0-6e9fe430771d.labels" -}}
helm.sh/chart: {{ include "go-echoe6f2b65a-edde-43c0-99a0-6e9fe430771d.chart" . }}
{{ include "go-echoe6f2b65a-edde-43c0-99a0-6e9fe430771d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe6f2b65a-edde-43c0-99a0-6e9fe430771d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe6f2b65a-edde-43c0-99a0-6e9fe430771d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
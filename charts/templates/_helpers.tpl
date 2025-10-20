
{{- define "go-echo53f528fc-7fc2-4eae-9e97-502dcff2eb5b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53f528fc-7fc2-4eae-9e97-502dcff2eb5b.fullname" -}}
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


{{- define "go-echo53f528fc-7fc2-4eae-9e97-502dcff2eb5b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53f528fc-7fc2-4eae-9e97-502dcff2eb5b.labels" -}}
helm.sh/chart: {{ include "go-echo53f528fc-7fc2-4eae-9e97-502dcff2eb5b.chart" . }}
{{ include "go-echo53f528fc-7fc2-4eae-9e97-502dcff2eb5b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo53f528fc-7fc2-4eae-9e97-502dcff2eb5b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo53f528fc-7fc2-4eae-9e97-502dcff2eb5b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
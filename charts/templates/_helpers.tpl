
{{- define "go-echo261f0a9d-d28d-4d0e-b73b-279555aae60f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo261f0a9d-d28d-4d0e-b73b-279555aae60f.fullname" -}}
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


{{- define "go-echo261f0a9d-d28d-4d0e-b73b-279555aae60f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo261f0a9d-d28d-4d0e-b73b-279555aae60f.labels" -}}
helm.sh/chart: {{ include "go-echo261f0a9d-d28d-4d0e-b73b-279555aae60f.chart" . }}
{{ include "go-echo261f0a9d-d28d-4d0e-b73b-279555aae60f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo261f0a9d-d28d-4d0e-b73b-279555aae60f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo261f0a9d-d28d-4d0e-b73b-279555aae60f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
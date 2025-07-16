
{{- define "go-echo03322444-116f-4764-8c2d-55223e8fa93f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03322444-116f-4764-8c2d-55223e8fa93f.fullname" -}}
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


{{- define "go-echo03322444-116f-4764-8c2d-55223e8fa93f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03322444-116f-4764-8c2d-55223e8fa93f.labels" -}}
helm.sh/chart: {{ include "go-echo03322444-116f-4764-8c2d-55223e8fa93f.chart" . }}
{{ include "go-echo03322444-116f-4764-8c2d-55223e8fa93f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo03322444-116f-4764-8c2d-55223e8fa93f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo03322444-116f-4764-8c2d-55223e8fa93f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
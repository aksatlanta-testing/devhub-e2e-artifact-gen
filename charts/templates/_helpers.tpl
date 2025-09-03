
{{- define "go-echo47dae5f9-97b0-4e94-9857-a3d7f11d3f2f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47dae5f9-97b0-4e94-9857-a3d7f11d3f2f.fullname" -}}
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


{{- define "go-echo47dae5f9-97b0-4e94-9857-a3d7f11d3f2f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo47dae5f9-97b0-4e94-9857-a3d7f11d3f2f.labels" -}}
helm.sh/chart: {{ include "go-echo47dae5f9-97b0-4e94-9857-a3d7f11d3f2f.chart" . }}
{{ include "go-echo47dae5f9-97b0-4e94-9857-a3d7f11d3f2f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo47dae5f9-97b0-4e94-9857-a3d7f11d3f2f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo47dae5f9-97b0-4e94-9857-a3d7f11d3f2f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
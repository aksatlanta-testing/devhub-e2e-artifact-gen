
{{- define "go-echo4ce5b6fb-3d3d-48ca-9c8a-2cb9125493ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ce5b6fb-3d3d-48ca-9c8a-2cb9125493ab.fullname" -}}
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


{{- define "go-echo4ce5b6fb-3d3d-48ca-9c8a-2cb9125493ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ce5b6fb-3d3d-48ca-9c8a-2cb9125493ab.labels" -}}
helm.sh/chart: {{ include "go-echo4ce5b6fb-3d3d-48ca-9c8a-2cb9125493ab.chart" . }}
{{ include "go-echo4ce5b6fb-3d3d-48ca-9c8a-2cb9125493ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4ce5b6fb-3d3d-48ca-9c8a-2cb9125493ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4ce5b6fb-3d3d-48ca-9c8a-2cb9125493ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
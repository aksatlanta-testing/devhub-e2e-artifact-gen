
{{- define "go-echo074bf78b-630f-4dc2-9ff2-3abc505b19dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo074bf78b-630f-4dc2-9ff2-3abc505b19dc.fullname" -}}
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


{{- define "go-echo074bf78b-630f-4dc2-9ff2-3abc505b19dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo074bf78b-630f-4dc2-9ff2-3abc505b19dc.labels" -}}
helm.sh/chart: {{ include "go-echo074bf78b-630f-4dc2-9ff2-3abc505b19dc.chart" . }}
{{ include "go-echo074bf78b-630f-4dc2-9ff2-3abc505b19dc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo074bf78b-630f-4dc2-9ff2-3abc505b19dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo074bf78b-630f-4dc2-9ff2-3abc505b19dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
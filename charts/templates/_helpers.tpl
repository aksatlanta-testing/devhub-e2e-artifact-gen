
{{- define "go-echocaa00db2-e497-401a-ad38-a068d05c9487.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocaa00db2-e497-401a-ad38-a068d05c9487.fullname" -}}
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


{{- define "go-echocaa00db2-e497-401a-ad38-a068d05c9487.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocaa00db2-e497-401a-ad38-a068d05c9487.labels" -}}
helm.sh/chart: {{ include "go-echocaa00db2-e497-401a-ad38-a068d05c9487.chart" . }}
{{ include "go-echocaa00db2-e497-401a-ad38-a068d05c9487.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocaa00db2-e497-401a-ad38-a068d05c9487.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocaa00db2-e497-401a-ad38-a068d05c9487.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
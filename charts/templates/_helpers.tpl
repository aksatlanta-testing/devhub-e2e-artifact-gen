
{{- define "go-echoccefa651-98a5-427a-9dff-588691d7d2fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoccefa651-98a5-427a-9dff-588691d7d2fd.fullname" -}}
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


{{- define "go-echoccefa651-98a5-427a-9dff-588691d7d2fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoccefa651-98a5-427a-9dff-588691d7d2fd.labels" -}}
helm.sh/chart: {{ include "go-echoccefa651-98a5-427a-9dff-588691d7d2fd.chart" . }}
{{ include "go-echoccefa651-98a5-427a-9dff-588691d7d2fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoccefa651-98a5-427a-9dff-588691d7d2fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoccefa651-98a5-427a-9dff-588691d7d2fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
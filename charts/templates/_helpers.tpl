
{{- define "go-echoc868f6a5-11d2-4e43-8bd3-f604171f12cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc868f6a5-11d2-4e43-8bd3-f604171f12cb.fullname" -}}
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


{{- define "go-echoc868f6a5-11d2-4e43-8bd3-f604171f12cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc868f6a5-11d2-4e43-8bd3-f604171f12cb.labels" -}}
helm.sh/chart: {{ include "go-echoc868f6a5-11d2-4e43-8bd3-f604171f12cb.chart" . }}
{{ include "go-echoc868f6a5-11d2-4e43-8bd3-f604171f12cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc868f6a5-11d2-4e43-8bd3-f604171f12cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc868f6a5-11d2-4e43-8bd3-f604171f12cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
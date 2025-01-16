
{{- define "go-echo6fc5ab1c-33eb-4442-97ad-8935a6915a51.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fc5ab1c-33eb-4442-97ad-8935a6915a51.fullname" -}}
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


{{- define "go-echo6fc5ab1c-33eb-4442-97ad-8935a6915a51.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6fc5ab1c-33eb-4442-97ad-8935a6915a51.labels" -}}
helm.sh/chart: {{ include "go-echo6fc5ab1c-33eb-4442-97ad-8935a6915a51.chart" . }}
{{ include "go-echo6fc5ab1c-33eb-4442-97ad-8935a6915a51.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6fc5ab1c-33eb-4442-97ad-8935a6915a51.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6fc5ab1c-33eb-4442-97ad-8935a6915a51.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
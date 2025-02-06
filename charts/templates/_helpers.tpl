
{{- define "go-echobe73962c-216e-4242-a54d-30232761e1cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe73962c-216e-4242-a54d-30232761e1cd.fullname" -}}
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


{{- define "go-echobe73962c-216e-4242-a54d-30232761e1cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobe73962c-216e-4242-a54d-30232761e1cd.labels" -}}
helm.sh/chart: {{ include "go-echobe73962c-216e-4242-a54d-30232761e1cd.chart" . }}
{{ include "go-echobe73962c-216e-4242-a54d-30232761e1cd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobe73962c-216e-4242-a54d-30232761e1cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobe73962c-216e-4242-a54d-30232761e1cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echod123d145-d940-4a55-933b-42e9568f538d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod123d145-d940-4a55-933b-42e9568f538d.fullname" -}}
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


{{- define "go-echod123d145-d940-4a55-933b-42e9568f538d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod123d145-d940-4a55-933b-42e9568f538d.labels" -}}
helm.sh/chart: {{ include "go-echod123d145-d940-4a55-933b-42e9568f538d.chart" . }}
{{ include "go-echod123d145-d940-4a55-933b-42e9568f538d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod123d145-d940-4a55-933b-42e9568f538d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod123d145-d940-4a55-933b-42e9568f538d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
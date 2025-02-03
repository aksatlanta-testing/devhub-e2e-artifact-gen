
{{- define "go-echo6686843b-ee9f-4b67-8379-5ebda99d6471.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6686843b-ee9f-4b67-8379-5ebda99d6471.fullname" -}}
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


{{- define "go-echo6686843b-ee9f-4b67-8379-5ebda99d6471.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6686843b-ee9f-4b67-8379-5ebda99d6471.labels" -}}
helm.sh/chart: {{ include "go-echo6686843b-ee9f-4b67-8379-5ebda99d6471.chart" . }}
{{ include "go-echo6686843b-ee9f-4b67-8379-5ebda99d6471.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6686843b-ee9f-4b67-8379-5ebda99d6471.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6686843b-ee9f-4b67-8379-5ebda99d6471.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
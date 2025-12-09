
{{- define "go-echoe58482c7-bab8-4101-8c76-a1e0a080ef98.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe58482c7-bab8-4101-8c76-a1e0a080ef98.fullname" -}}
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


{{- define "go-echoe58482c7-bab8-4101-8c76-a1e0a080ef98.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe58482c7-bab8-4101-8c76-a1e0a080ef98.labels" -}}
helm.sh/chart: {{ include "go-echoe58482c7-bab8-4101-8c76-a1e0a080ef98.chart" . }}
{{ include "go-echoe58482c7-bab8-4101-8c76-a1e0a080ef98.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe58482c7-bab8-4101-8c76-a1e0a080ef98.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe58482c7-bab8-4101-8c76-a1e0a080ef98.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
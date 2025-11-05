
{{- define "go-echoddd46792-4aaf-44e4-974e-49d8cf30c66c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoddd46792-4aaf-44e4-974e-49d8cf30c66c.fullname" -}}
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


{{- define "go-echoddd46792-4aaf-44e4-974e-49d8cf30c66c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoddd46792-4aaf-44e4-974e-49d8cf30c66c.labels" -}}
helm.sh/chart: {{ include "go-echoddd46792-4aaf-44e4-974e-49d8cf30c66c.chart" . }}
{{ include "go-echoddd46792-4aaf-44e4-974e-49d8cf30c66c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoddd46792-4aaf-44e4-974e-49d8cf30c66c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoddd46792-4aaf-44e4-974e-49d8cf30c66c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
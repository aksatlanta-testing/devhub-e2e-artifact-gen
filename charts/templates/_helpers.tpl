
{{- define "go-echocfa8e1bc-c912-40ea-8175-8e97e77da481.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfa8e1bc-c912-40ea-8175-8e97e77da481.fullname" -}}
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


{{- define "go-echocfa8e1bc-c912-40ea-8175-8e97e77da481.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocfa8e1bc-c912-40ea-8175-8e97e77da481.labels" -}}
helm.sh/chart: {{ include "go-echocfa8e1bc-c912-40ea-8175-8e97e77da481.chart" . }}
{{ include "go-echocfa8e1bc-c912-40ea-8175-8e97e77da481.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocfa8e1bc-c912-40ea-8175-8e97e77da481.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocfa8e1bc-c912-40ea-8175-8e97e77da481.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo98758806-7b92-4600-a808-4a1519fa15aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo98758806-7b92-4600-a808-4a1519fa15aa.fullname" -}}
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


{{- define "go-echo98758806-7b92-4600-a808-4a1519fa15aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo98758806-7b92-4600-a808-4a1519fa15aa.labels" -}}
helm.sh/chart: {{ include "go-echo98758806-7b92-4600-a808-4a1519fa15aa.chart" . }}
{{ include "go-echo98758806-7b92-4600-a808-4a1519fa15aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo98758806-7b92-4600-a808-4a1519fa15aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo98758806-7b92-4600-a808-4a1519fa15aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
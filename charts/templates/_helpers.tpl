
{{- define "go-echo98c21eec-38d3-4301-af52-ec3406114003.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo98c21eec-38d3-4301-af52-ec3406114003.fullname" -}}
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


{{- define "go-echo98c21eec-38d3-4301-af52-ec3406114003.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo98c21eec-38d3-4301-af52-ec3406114003.labels" -}}
helm.sh/chart: {{ include "go-echo98c21eec-38d3-4301-af52-ec3406114003.chart" . }}
{{ include "go-echo98c21eec-38d3-4301-af52-ec3406114003.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo98c21eec-38d3-4301-af52-ec3406114003.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo98c21eec-38d3-4301-af52-ec3406114003.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
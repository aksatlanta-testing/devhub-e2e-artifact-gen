
{{- define "go-echo8e08a8ff-8739-489f-bf51-7a83802242ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8e08a8ff-8739-489f-bf51-7a83802242ef.fullname" -}}
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


{{- define "go-echo8e08a8ff-8739-489f-bf51-7a83802242ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8e08a8ff-8739-489f-bf51-7a83802242ef.labels" -}}
helm.sh/chart: {{ include "go-echo8e08a8ff-8739-489f-bf51-7a83802242ef.chart" . }}
{{ include "go-echo8e08a8ff-8739-489f-bf51-7a83802242ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8e08a8ff-8739-489f-bf51-7a83802242ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8e08a8ff-8739-489f-bf51-7a83802242ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo91cb4511-da32-4cac-b32a-ec86be1472fd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo91cb4511-da32-4cac-b32a-ec86be1472fd.fullname" -}}
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


{{- define "go-echo91cb4511-da32-4cac-b32a-ec86be1472fd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo91cb4511-da32-4cac-b32a-ec86be1472fd.labels" -}}
helm.sh/chart: {{ include "go-echo91cb4511-da32-4cac-b32a-ec86be1472fd.chart" . }}
{{ include "go-echo91cb4511-da32-4cac-b32a-ec86be1472fd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo91cb4511-da32-4cac-b32a-ec86be1472fd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo91cb4511-da32-4cac-b32a-ec86be1472fd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
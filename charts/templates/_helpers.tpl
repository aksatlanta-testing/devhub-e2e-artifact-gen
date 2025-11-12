
{{- define "go-echofef54758-b355-4707-aeaa-07b8d640088e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofef54758-b355-4707-aeaa-07b8d640088e.fullname" -}}
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


{{- define "go-echofef54758-b355-4707-aeaa-07b8d640088e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofef54758-b355-4707-aeaa-07b8d640088e.labels" -}}
helm.sh/chart: {{ include "go-echofef54758-b355-4707-aeaa-07b8d640088e.chart" . }}
{{ include "go-echofef54758-b355-4707-aeaa-07b8d640088e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofef54758-b355-4707-aeaa-07b8d640088e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofef54758-b355-4707-aeaa-07b8d640088e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
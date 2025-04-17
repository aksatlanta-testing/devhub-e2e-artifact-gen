
{{- define "go-echo7652d0c6-f143-40aa-b014-7ed7deb1be41.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7652d0c6-f143-40aa-b014-7ed7deb1be41.fullname" -}}
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


{{- define "go-echo7652d0c6-f143-40aa-b014-7ed7deb1be41.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7652d0c6-f143-40aa-b014-7ed7deb1be41.labels" -}}
helm.sh/chart: {{ include "go-echo7652d0c6-f143-40aa-b014-7ed7deb1be41.chart" . }}
{{ include "go-echo7652d0c6-f143-40aa-b014-7ed7deb1be41.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7652d0c6-f143-40aa-b014-7ed7deb1be41.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7652d0c6-f143-40aa-b014-7ed7deb1be41.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
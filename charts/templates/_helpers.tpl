
{{- define "go-echoce5f51dc-6a9a-4c76-aeef-be741016441c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce5f51dc-6a9a-4c76-aeef-be741016441c.fullname" -}}
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


{{- define "go-echoce5f51dc-6a9a-4c76-aeef-be741016441c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce5f51dc-6a9a-4c76-aeef-be741016441c.labels" -}}
helm.sh/chart: {{ include "go-echoce5f51dc-6a9a-4c76-aeef-be741016441c.chart" . }}
{{ include "go-echoce5f51dc-6a9a-4c76-aeef-be741016441c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce5f51dc-6a9a-4c76-aeef-be741016441c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce5f51dc-6a9a-4c76-aeef-be741016441c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
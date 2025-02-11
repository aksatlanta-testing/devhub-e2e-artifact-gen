
{{- define "go-echodcaf856d-8238-4823-9cb3-653cef7cf5f7.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodcaf856d-8238-4823-9cb3-653cef7cf5f7.fullname" -}}
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


{{- define "go-echodcaf856d-8238-4823-9cb3-653cef7cf5f7.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodcaf856d-8238-4823-9cb3-653cef7cf5f7.labels" -}}
helm.sh/chart: {{ include "go-echodcaf856d-8238-4823-9cb3-653cef7cf5f7.chart" . }}
{{ include "go-echodcaf856d-8238-4823-9cb3-653cef7cf5f7.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodcaf856d-8238-4823-9cb3-653cef7cf5f7.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodcaf856d-8238-4823-9cb3-653cef7cf5f7.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
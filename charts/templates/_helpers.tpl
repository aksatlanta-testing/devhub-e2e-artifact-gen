
{{- define "go-echode474e2a-8824-4d4d-8161-be270b82c687.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode474e2a-8824-4d4d-8161-be270b82c687.fullname" -}}
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


{{- define "go-echode474e2a-8824-4d4d-8161-be270b82c687.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echode474e2a-8824-4d4d-8161-be270b82c687.labels" -}}
helm.sh/chart: {{ include "go-echode474e2a-8824-4d4d-8161-be270b82c687.chart" . }}
{{ include "go-echode474e2a-8824-4d4d-8161-be270b82c687.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echode474e2a-8824-4d4d-8161-be270b82c687.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echode474e2a-8824-4d4d-8161-be270b82c687.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
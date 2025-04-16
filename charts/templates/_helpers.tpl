
{{- define "go-echof09c8bc8-ef46-4462-8381-639dddae3d47.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof09c8bc8-ef46-4462-8381-639dddae3d47.fullname" -}}
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


{{- define "go-echof09c8bc8-ef46-4462-8381-639dddae3d47.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof09c8bc8-ef46-4462-8381-639dddae3d47.labels" -}}
helm.sh/chart: {{ include "go-echof09c8bc8-ef46-4462-8381-639dddae3d47.chart" . }}
{{ include "go-echof09c8bc8-ef46-4462-8381-639dddae3d47.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof09c8bc8-ef46-4462-8381-639dddae3d47.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof09c8bc8-ef46-4462-8381-639dddae3d47.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
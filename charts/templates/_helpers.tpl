
{{- define "go-echoffdad95f-ff4a-44f2-af78-10d7f5bc8f10.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffdad95f-ff4a-44f2-af78-10d7f5bc8f10.fullname" -}}
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


{{- define "go-echoffdad95f-ff4a-44f2-af78-10d7f5bc8f10.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoffdad95f-ff4a-44f2-af78-10d7f5bc8f10.labels" -}}
helm.sh/chart: {{ include "go-echoffdad95f-ff4a-44f2-af78-10d7f5bc8f10.chart" . }}
{{ include "go-echoffdad95f-ff4a-44f2-af78-10d7f5bc8f10.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoffdad95f-ff4a-44f2-af78-10d7f5bc8f10.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoffdad95f-ff4a-44f2-af78-10d7f5bc8f10.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
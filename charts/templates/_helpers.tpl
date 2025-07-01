
{{- define "go-echofacdb058-f43d-45c8-82ee-1beb9123397a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofacdb058-f43d-45c8-82ee-1beb9123397a.fullname" -}}
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


{{- define "go-echofacdb058-f43d-45c8-82ee-1beb9123397a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofacdb058-f43d-45c8-82ee-1beb9123397a.labels" -}}
helm.sh/chart: {{ include "go-echofacdb058-f43d-45c8-82ee-1beb9123397a.chart" . }}
{{ include "go-echofacdb058-f43d-45c8-82ee-1beb9123397a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofacdb058-f43d-45c8-82ee-1beb9123397a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofacdb058-f43d-45c8-82ee-1beb9123397a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
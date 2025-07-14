
{{- define "go-echoadbb30fa-7b1f-4f54-a9b8-bf1496d0901b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadbb30fa-7b1f-4f54-a9b8-bf1496d0901b.fullname" -}}
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


{{- define "go-echoadbb30fa-7b1f-4f54-a9b8-bf1496d0901b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadbb30fa-7b1f-4f54-a9b8-bf1496d0901b.labels" -}}
helm.sh/chart: {{ include "go-echoadbb30fa-7b1f-4f54-a9b8-bf1496d0901b.chart" . }}
{{ include "go-echoadbb30fa-7b1f-4f54-a9b8-bf1496d0901b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoadbb30fa-7b1f-4f54-a9b8-bf1496d0901b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoadbb30fa-7b1f-4f54-a9b8-bf1496d0901b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
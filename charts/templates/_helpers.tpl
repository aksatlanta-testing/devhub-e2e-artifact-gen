
{{- define "go-echoca53768f-8a4d-4674-ad50-b8aed0b1b698.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca53768f-8a4d-4674-ad50-b8aed0b1b698.fullname" -}}
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


{{- define "go-echoca53768f-8a4d-4674-ad50-b8aed0b1b698.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca53768f-8a4d-4674-ad50-b8aed0b1b698.labels" -}}
helm.sh/chart: {{ include "go-echoca53768f-8a4d-4674-ad50-b8aed0b1b698.chart" . }}
{{ include "go-echoca53768f-8a4d-4674-ad50-b8aed0b1b698.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca53768f-8a4d-4674-ad50-b8aed0b1b698.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca53768f-8a4d-4674-ad50-b8aed0b1b698.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
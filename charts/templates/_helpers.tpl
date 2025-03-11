
{{- define "go-echo61a3986c-135a-4a3d-bf2f-f8c6d1a238cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61a3986c-135a-4a3d-bf2f-f8c6d1a238cf.fullname" -}}
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


{{- define "go-echo61a3986c-135a-4a3d-bf2f-f8c6d1a238cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo61a3986c-135a-4a3d-bf2f-f8c6d1a238cf.labels" -}}
helm.sh/chart: {{ include "go-echo61a3986c-135a-4a3d-bf2f-f8c6d1a238cf.chart" . }}
{{ include "go-echo61a3986c-135a-4a3d-bf2f-f8c6d1a238cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo61a3986c-135a-4a3d-bf2f-f8c6d1a238cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo61a3986c-135a-4a3d-bf2f-f8c6d1a238cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
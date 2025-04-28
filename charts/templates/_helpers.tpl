
{{- define "go-echo4b8c90a9-a7c6-4ee2-841b-9a89de8f0688.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4b8c90a9-a7c6-4ee2-841b-9a89de8f0688.fullname" -}}
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


{{- define "go-echo4b8c90a9-a7c6-4ee2-841b-9a89de8f0688.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4b8c90a9-a7c6-4ee2-841b-9a89de8f0688.labels" -}}
helm.sh/chart: {{ include "go-echo4b8c90a9-a7c6-4ee2-841b-9a89de8f0688.chart" . }}
{{ include "go-echo4b8c90a9-a7c6-4ee2-841b-9a89de8f0688.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4b8c90a9-a7c6-4ee2-841b-9a89de8f0688.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4b8c90a9-a7c6-4ee2-841b-9a89de8f0688.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
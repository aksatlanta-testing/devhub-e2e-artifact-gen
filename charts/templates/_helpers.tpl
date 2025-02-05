
{{- define "go-echo16ab0d1e-399b-4c29-a79c-fd6a6c83faca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo16ab0d1e-399b-4c29-a79c-fd6a6c83faca.fullname" -}}
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


{{- define "go-echo16ab0d1e-399b-4c29-a79c-fd6a6c83faca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo16ab0d1e-399b-4c29-a79c-fd6a6c83faca.labels" -}}
helm.sh/chart: {{ include "go-echo16ab0d1e-399b-4c29-a79c-fd6a6c83faca.chart" . }}
{{ include "go-echo16ab0d1e-399b-4c29-a79c-fd6a6c83faca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo16ab0d1e-399b-4c29-a79c-fd6a6c83faca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo16ab0d1e-399b-4c29-a79c-fd6a6c83faca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
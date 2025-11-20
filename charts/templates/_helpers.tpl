
{{- define "go-echo39c2a9aa-af83-4f89-9f42-e6c349c413ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39c2a9aa-af83-4f89-9f42-e6c349c413ca.fullname" -}}
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


{{- define "go-echo39c2a9aa-af83-4f89-9f42-e6c349c413ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo39c2a9aa-af83-4f89-9f42-e6c349c413ca.labels" -}}
helm.sh/chart: {{ include "go-echo39c2a9aa-af83-4f89-9f42-e6c349c413ca.chart" . }}
{{ include "go-echo39c2a9aa-af83-4f89-9f42-e6c349c413ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo39c2a9aa-af83-4f89-9f42-e6c349c413ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo39c2a9aa-af83-4f89-9f42-e6c349c413ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
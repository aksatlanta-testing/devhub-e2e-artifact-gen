
{{- define "go-echocb00d513-2ea3-4349-a907-4ae7b419faab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb00d513-2ea3-4349-a907-4ae7b419faab.fullname" -}}
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


{{- define "go-echocb00d513-2ea3-4349-a907-4ae7b419faab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb00d513-2ea3-4349-a907-4ae7b419faab.labels" -}}
helm.sh/chart: {{ include "go-echocb00d513-2ea3-4349-a907-4ae7b419faab.chart" . }}
{{ include "go-echocb00d513-2ea3-4349-a907-4ae7b419faab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb00d513-2ea3-4349-a907-4ae7b419faab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb00d513-2ea3-4349-a907-4ae7b419faab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
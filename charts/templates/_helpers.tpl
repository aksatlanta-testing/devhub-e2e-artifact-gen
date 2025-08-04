
{{- define "go-echocb08e538-4010-4a0c-9fac-e34a8539404b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb08e538-4010-4a0c-9fac-e34a8539404b.fullname" -}}
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


{{- define "go-echocb08e538-4010-4a0c-9fac-e34a8539404b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb08e538-4010-4a0c-9fac-e34a8539404b.labels" -}}
helm.sh/chart: {{ include "go-echocb08e538-4010-4a0c-9fac-e34a8539404b.chart" . }}
{{ include "go-echocb08e538-4010-4a0c-9fac-e34a8539404b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb08e538-4010-4a0c-9fac-e34a8539404b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb08e538-4010-4a0c-9fac-e34a8539404b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
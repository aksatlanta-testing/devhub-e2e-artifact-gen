
{{- define "go-echo2e17c435-c223-4371-bb96-dc016494938d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2e17c435-c223-4371-bb96-dc016494938d.fullname" -}}
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


{{- define "go-echo2e17c435-c223-4371-bb96-dc016494938d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2e17c435-c223-4371-bb96-dc016494938d.labels" -}}
helm.sh/chart: {{ include "go-echo2e17c435-c223-4371-bb96-dc016494938d.chart" . }}
{{ include "go-echo2e17c435-c223-4371-bb96-dc016494938d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2e17c435-c223-4371-bb96-dc016494938d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2e17c435-c223-4371-bb96-dc016494938d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoe6f75e38-60ce-49a0-b2e4-a32acaee7697.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6f75e38-60ce-49a0-b2e4-a32acaee7697.fullname" -}}
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


{{- define "go-echoe6f75e38-60ce-49a0-b2e4-a32acaee7697.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe6f75e38-60ce-49a0-b2e4-a32acaee7697.labels" -}}
helm.sh/chart: {{ include "go-echoe6f75e38-60ce-49a0-b2e4-a32acaee7697.chart" . }}
{{ include "go-echoe6f75e38-60ce-49a0-b2e4-a32acaee7697.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe6f75e38-60ce-49a0-b2e4-a32acaee7697.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe6f75e38-60ce-49a0-b2e4-a32acaee7697.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
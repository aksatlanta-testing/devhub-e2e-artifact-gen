
{{- define "go-echoc30f0803-0237-448c-9457-6f0c7d70e83b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc30f0803-0237-448c-9457-6f0c7d70e83b.fullname" -}}
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


{{- define "go-echoc30f0803-0237-448c-9457-6f0c7d70e83b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc30f0803-0237-448c-9457-6f0c7d70e83b.labels" -}}
helm.sh/chart: {{ include "go-echoc30f0803-0237-448c-9457-6f0c7d70e83b.chart" . }}
{{ include "go-echoc30f0803-0237-448c-9457-6f0c7d70e83b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc30f0803-0237-448c-9457-6f0c7d70e83b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc30f0803-0237-448c-9457-6f0c7d70e83b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
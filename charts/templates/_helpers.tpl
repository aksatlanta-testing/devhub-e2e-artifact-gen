
{{- define "go-echo24bcf046-598a-4646-949b-8bd53caa8ff3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24bcf046-598a-4646-949b-8bd53caa8ff3.fullname" -}}
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


{{- define "go-echo24bcf046-598a-4646-949b-8bd53caa8ff3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo24bcf046-598a-4646-949b-8bd53caa8ff3.labels" -}}
helm.sh/chart: {{ include "go-echo24bcf046-598a-4646-949b-8bd53caa8ff3.chart" . }}
{{ include "go-echo24bcf046-598a-4646-949b-8bd53caa8ff3.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo24bcf046-598a-4646-949b-8bd53caa8ff3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo24bcf046-598a-4646-949b-8bd53caa8ff3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
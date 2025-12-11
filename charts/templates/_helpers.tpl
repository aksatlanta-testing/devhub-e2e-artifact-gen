
{{- define "go-echo8aee401e-16a5-4f07-8656-4ce23de4a77e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8aee401e-16a5-4f07-8656-4ce23de4a77e.fullname" -}}
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


{{- define "go-echo8aee401e-16a5-4f07-8656-4ce23de4a77e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8aee401e-16a5-4f07-8656-4ce23de4a77e.labels" -}}
helm.sh/chart: {{ include "go-echo8aee401e-16a5-4f07-8656-4ce23de4a77e.chart" . }}
{{ include "go-echo8aee401e-16a5-4f07-8656-4ce23de4a77e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8aee401e-16a5-4f07-8656-4ce23de4a77e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8aee401e-16a5-4f07-8656-4ce23de4a77e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
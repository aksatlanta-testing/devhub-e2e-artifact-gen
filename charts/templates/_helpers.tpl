
{{- define "go-echoebde9a7f-08e4-4f2a-9acd-60bb046bd34b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebde9a7f-08e4-4f2a-9acd-60bb046bd34b.fullname" -}}
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


{{- define "go-echoebde9a7f-08e4-4f2a-9acd-60bb046bd34b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebde9a7f-08e4-4f2a-9acd-60bb046bd34b.labels" -}}
helm.sh/chart: {{ include "go-echoebde9a7f-08e4-4f2a-9acd-60bb046bd34b.chart" . }}
{{ include "go-echoebde9a7f-08e4-4f2a-9acd-60bb046bd34b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebde9a7f-08e4-4f2a-9acd-60bb046bd34b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebde9a7f-08e4-4f2a-9acd-60bb046bd34b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
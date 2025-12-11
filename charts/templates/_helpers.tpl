
{{- define "go-echo349ed26c-7661-489f-8937-e5c27421bfda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo349ed26c-7661-489f-8937-e5c27421bfda.fullname" -}}
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


{{- define "go-echo349ed26c-7661-489f-8937-e5c27421bfda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo349ed26c-7661-489f-8937-e5c27421bfda.labels" -}}
helm.sh/chart: {{ include "go-echo349ed26c-7661-489f-8937-e5c27421bfda.chart" . }}
{{ include "go-echo349ed26c-7661-489f-8937-e5c27421bfda.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo349ed26c-7661-489f-8937-e5c27421bfda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo349ed26c-7661-489f-8937-e5c27421bfda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
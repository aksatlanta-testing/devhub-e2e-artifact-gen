
{{- define "go-echo0edf3323-51f8-4cd6-a59e-eac595c06cbe.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0edf3323-51f8-4cd6-a59e-eac595c06cbe.fullname" -}}
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


{{- define "go-echo0edf3323-51f8-4cd6-a59e-eac595c06cbe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0edf3323-51f8-4cd6-a59e-eac595c06cbe.labels" -}}
helm.sh/chart: {{ include "go-echo0edf3323-51f8-4cd6-a59e-eac595c06cbe.chart" . }}
{{ include "go-echo0edf3323-51f8-4cd6-a59e-eac595c06cbe.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0edf3323-51f8-4cd6-a59e-eac595c06cbe.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0edf3323-51f8-4cd6-a59e-eac595c06cbe.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
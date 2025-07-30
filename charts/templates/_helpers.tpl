
{{- define "go-echo060e6173-b5a9-4f5c-9dfe-dfcd3f695902.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo060e6173-b5a9-4f5c-9dfe-dfcd3f695902.fullname" -}}
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


{{- define "go-echo060e6173-b5a9-4f5c-9dfe-dfcd3f695902.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo060e6173-b5a9-4f5c-9dfe-dfcd3f695902.labels" -}}
helm.sh/chart: {{ include "go-echo060e6173-b5a9-4f5c-9dfe-dfcd3f695902.chart" . }}
{{ include "go-echo060e6173-b5a9-4f5c-9dfe-dfcd3f695902.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo060e6173-b5a9-4f5c-9dfe-dfcd3f695902.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo060e6173-b5a9-4f5c-9dfe-dfcd3f695902.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
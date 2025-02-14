
{{- define "go-echobd349d4f-9d54-4c15-b456-c5c7b676f08a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd349d4f-9d54-4c15-b456-c5c7b676f08a.fullname" -}}
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


{{- define "go-echobd349d4f-9d54-4c15-b456-c5c7b676f08a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd349d4f-9d54-4c15-b456-c5c7b676f08a.labels" -}}
helm.sh/chart: {{ include "go-echobd349d4f-9d54-4c15-b456-c5c7b676f08a.chart" . }}
{{ include "go-echobd349d4f-9d54-4c15-b456-c5c7b676f08a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd349d4f-9d54-4c15-b456-c5c7b676f08a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd349d4f-9d54-4c15-b456-c5c7b676f08a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echobc0c3ef3-a4b4-4a3f-81f1-5c090b42684a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc0c3ef3-a4b4-4a3f-81f1-5c090b42684a.fullname" -}}
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


{{- define "go-echobc0c3ef3-a4b4-4a3f-81f1-5c090b42684a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobc0c3ef3-a4b4-4a3f-81f1-5c090b42684a.labels" -}}
helm.sh/chart: {{ include "go-echobc0c3ef3-a4b4-4a3f-81f1-5c090b42684a.chart" . }}
{{ include "go-echobc0c3ef3-a4b4-4a3f-81f1-5c090b42684a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobc0c3ef3-a4b4-4a3f-81f1-5c090b42684a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobc0c3ef3-a4b4-4a3f-81f1-5c090b42684a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echocd3c7530-d474-4d5f-889d-ae6f5c53960c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd3c7530-d474-4d5f-889d-ae6f5c53960c.fullname" -}}
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


{{- define "go-echocd3c7530-d474-4d5f-889d-ae6f5c53960c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd3c7530-d474-4d5f-889d-ae6f5c53960c.labels" -}}
helm.sh/chart: {{ include "go-echocd3c7530-d474-4d5f-889d-ae6f5c53960c.chart" . }}
{{ include "go-echocd3c7530-d474-4d5f-889d-ae6f5c53960c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocd3c7530-d474-4d5f-889d-ae6f5c53960c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd3c7530-d474-4d5f-889d-ae6f5c53960c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
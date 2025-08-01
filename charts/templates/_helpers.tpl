
{{- define "go-echofa438a34-2d17-475c-a20d-874b790b6513.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa438a34-2d17-475c-a20d-874b790b6513.fullname" -}}
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


{{- define "go-echofa438a34-2d17-475c-a20d-874b790b6513.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofa438a34-2d17-475c-a20d-874b790b6513.labels" -}}
helm.sh/chart: {{ include "go-echofa438a34-2d17-475c-a20d-874b790b6513.chart" . }}
{{ include "go-echofa438a34-2d17-475c-a20d-874b790b6513.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofa438a34-2d17-475c-a20d-874b790b6513.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofa438a34-2d17-475c-a20d-874b790b6513.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
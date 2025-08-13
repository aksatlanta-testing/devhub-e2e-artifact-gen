
{{- define "go-echoecb0de1f-966b-480e-9532-da394809049d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecb0de1f-966b-480e-9532-da394809049d.fullname" -}}
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


{{- define "go-echoecb0de1f-966b-480e-9532-da394809049d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoecb0de1f-966b-480e-9532-da394809049d.labels" -}}
helm.sh/chart: {{ include "go-echoecb0de1f-966b-480e-9532-da394809049d.chart" . }}
{{ include "go-echoecb0de1f-966b-480e-9532-da394809049d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoecb0de1f-966b-480e-9532-da394809049d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoecb0de1f-966b-480e-9532-da394809049d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
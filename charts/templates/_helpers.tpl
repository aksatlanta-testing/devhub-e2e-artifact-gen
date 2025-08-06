
{{- define "go-echocd2b2a14-84a2-43e0-886b-fb4044e26bbb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd2b2a14-84a2-43e0-886b-fb4044e26bbb.fullname" -}}
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


{{- define "go-echocd2b2a14-84a2-43e0-886b-fb4044e26bbb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocd2b2a14-84a2-43e0-886b-fb4044e26bbb.labels" -}}
helm.sh/chart: {{ include "go-echocd2b2a14-84a2-43e0-886b-fb4044e26bbb.chart" . }}
{{ include "go-echocd2b2a14-84a2-43e0-886b-fb4044e26bbb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocd2b2a14-84a2-43e0-886b-fb4044e26bbb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocd2b2a14-84a2-43e0-886b-fb4044e26bbb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echocc7b10eb-d25e-43e6-8d04-9985b8dae0db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc7b10eb-d25e-43e6-8d04-9985b8dae0db.fullname" -}}
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


{{- define "go-echocc7b10eb-d25e-43e6-8d04-9985b8dae0db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc7b10eb-d25e-43e6-8d04-9985b8dae0db.labels" -}}
helm.sh/chart: {{ include "go-echocc7b10eb-d25e-43e6-8d04-9985b8dae0db.chart" . }}
{{ include "go-echocc7b10eb-d25e-43e6-8d04-9985b8dae0db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc7b10eb-d25e-43e6-8d04-9985b8dae0db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc7b10eb-d25e-43e6-8d04-9985b8dae0db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
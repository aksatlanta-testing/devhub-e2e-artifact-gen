
{{- define "go-echo5ae1f03c-b30f-4445-b22b-369860b0a9ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5ae1f03c-b30f-4445-b22b-369860b0a9ff.fullname" -}}
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


{{- define "go-echo5ae1f03c-b30f-4445-b22b-369860b0a9ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5ae1f03c-b30f-4445-b22b-369860b0a9ff.labels" -}}
helm.sh/chart: {{ include "go-echo5ae1f03c-b30f-4445-b22b-369860b0a9ff.chart" . }}
{{ include "go-echo5ae1f03c-b30f-4445-b22b-369860b0a9ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5ae1f03c-b30f-4445-b22b-369860b0a9ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5ae1f03c-b30f-4445-b22b-369860b0a9ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
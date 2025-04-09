
{{- define "go-echo476521c4-aa13-4381-981c-bcaad97acfdd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo476521c4-aa13-4381-981c-bcaad97acfdd.fullname" -}}
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


{{- define "go-echo476521c4-aa13-4381-981c-bcaad97acfdd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo476521c4-aa13-4381-981c-bcaad97acfdd.labels" -}}
helm.sh/chart: {{ include "go-echo476521c4-aa13-4381-981c-bcaad97acfdd.chart" . }}
{{ include "go-echo476521c4-aa13-4381-981c-bcaad97acfdd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo476521c4-aa13-4381-981c-bcaad97acfdd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo476521c4-aa13-4381-981c-bcaad97acfdd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
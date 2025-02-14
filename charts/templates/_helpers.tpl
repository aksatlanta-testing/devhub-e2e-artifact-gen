
{{- define "go-echoedebf5a4-b276-44fb-b848-925182b1f562.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedebf5a4-b276-44fb-b848-925182b1f562.fullname" -}}
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


{{- define "go-echoedebf5a4-b276-44fb-b848-925182b1f562.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoedebf5a4-b276-44fb-b848-925182b1f562.labels" -}}
helm.sh/chart: {{ include "go-echoedebf5a4-b276-44fb-b848-925182b1f562.chart" . }}
{{ include "go-echoedebf5a4-b276-44fb-b848-925182b1f562.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoedebf5a4-b276-44fb-b848-925182b1f562.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoedebf5a4-b276-44fb-b848-925182b1f562.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
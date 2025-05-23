
{{- define "go-echoae19356e-cde9-4231-add3-7cffe82f383d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae19356e-cde9-4231-add3-7cffe82f383d.fullname" -}}
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


{{- define "go-echoae19356e-cde9-4231-add3-7cffe82f383d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoae19356e-cde9-4231-add3-7cffe82f383d.labels" -}}
helm.sh/chart: {{ include "go-echoae19356e-cde9-4231-add3-7cffe82f383d.chart" . }}
{{ include "go-echoae19356e-cde9-4231-add3-7cffe82f383d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoae19356e-cde9-4231-add3-7cffe82f383d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoae19356e-cde9-4231-add3-7cffe82f383d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
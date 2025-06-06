
{{- define "go-echoaa6cd190-c5c5-414f-af20-77bad895551d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa6cd190-c5c5-414f-af20-77bad895551d.fullname" -}}
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


{{- define "go-echoaa6cd190-c5c5-414f-af20-77bad895551d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaa6cd190-c5c5-414f-af20-77bad895551d.labels" -}}
helm.sh/chart: {{ include "go-echoaa6cd190-c5c5-414f-af20-77bad895551d.chart" . }}
{{ include "go-echoaa6cd190-c5c5-414f-af20-77bad895551d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaa6cd190-c5c5-414f-af20-77bad895551d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaa6cd190-c5c5-414f-af20-77bad895551d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
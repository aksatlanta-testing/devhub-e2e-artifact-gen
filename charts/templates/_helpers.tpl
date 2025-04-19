
{{- define "go-echo529f6d50-f455-490f-b7a9-d9cd34aaff74.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo529f6d50-f455-490f-b7a9-d9cd34aaff74.fullname" -}}
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


{{- define "go-echo529f6d50-f455-490f-b7a9-d9cd34aaff74.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo529f6d50-f455-490f-b7a9-d9cd34aaff74.labels" -}}
helm.sh/chart: {{ include "go-echo529f6d50-f455-490f-b7a9-d9cd34aaff74.chart" . }}
{{ include "go-echo529f6d50-f455-490f-b7a9-d9cd34aaff74.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo529f6d50-f455-490f-b7a9-d9cd34aaff74.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo529f6d50-f455-490f-b7a9-d9cd34aaff74.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
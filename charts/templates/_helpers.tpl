
{{- define "go-echo3abb4007-1597-4a02-bf7f-ce5942a4a7dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3abb4007-1597-4a02-bf7f-ce5942a4a7dd.fullname" -}}
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


{{- define "go-echo3abb4007-1597-4a02-bf7f-ce5942a4a7dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3abb4007-1597-4a02-bf7f-ce5942a4a7dd.labels" -}}
helm.sh/chart: {{ include "go-echo3abb4007-1597-4a02-bf7f-ce5942a4a7dd.chart" . }}
{{ include "go-echo3abb4007-1597-4a02-bf7f-ce5942a4a7dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3abb4007-1597-4a02-bf7f-ce5942a4a7dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3abb4007-1597-4a02-bf7f-ce5942a4a7dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
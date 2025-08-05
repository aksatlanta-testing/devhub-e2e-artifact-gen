
{{- define "go-echocf683ca8-1ee1-4ad8-a203-0104587ff967.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf683ca8-1ee1-4ad8-a203-0104587ff967.fullname" -}}
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


{{- define "go-echocf683ca8-1ee1-4ad8-a203-0104587ff967.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf683ca8-1ee1-4ad8-a203-0104587ff967.labels" -}}
helm.sh/chart: {{ include "go-echocf683ca8-1ee1-4ad8-a203-0104587ff967.chart" . }}
{{ include "go-echocf683ca8-1ee1-4ad8-a203-0104587ff967.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf683ca8-1ee1-4ad8-a203-0104587ff967.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf683ca8-1ee1-4ad8-a203-0104587ff967.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
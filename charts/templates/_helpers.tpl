
{{- define "go-echocf3cba86-c22b-40dc-8b3f-18c6f26c1107.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf3cba86-c22b-40dc-8b3f-18c6f26c1107.fullname" -}}
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


{{- define "go-echocf3cba86-c22b-40dc-8b3f-18c6f26c1107.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocf3cba86-c22b-40dc-8b3f-18c6f26c1107.labels" -}}
helm.sh/chart: {{ include "go-echocf3cba86-c22b-40dc-8b3f-18c6f26c1107.chart" . }}
{{ include "go-echocf3cba86-c22b-40dc-8b3f-18c6f26c1107.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocf3cba86-c22b-40dc-8b3f-18c6f26c1107.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocf3cba86-c22b-40dc-8b3f-18c6f26c1107.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
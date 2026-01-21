
{{- define "go-echo5180276c-0b74-4625-8f63-3674de36363e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5180276c-0b74-4625-8f63-3674de36363e.fullname" -}}
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


{{- define "go-echo5180276c-0b74-4625-8f63-3674de36363e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5180276c-0b74-4625-8f63-3674de36363e.labels" -}}
helm.sh/chart: {{ include "go-echo5180276c-0b74-4625-8f63-3674de36363e.chart" . }}
{{ include "go-echo5180276c-0b74-4625-8f63-3674de36363e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5180276c-0b74-4625-8f63-3674de36363e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5180276c-0b74-4625-8f63-3674de36363e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
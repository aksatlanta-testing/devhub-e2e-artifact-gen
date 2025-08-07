
{{- define "go-echoafd34f41-f87d-4bc8-807e-0a20bced47ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafd34f41-f87d-4bc8-807e-0a20bced47ac.fullname" -}}
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


{{- define "go-echoafd34f41-f87d-4bc8-807e-0a20bced47ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoafd34f41-f87d-4bc8-807e-0a20bced47ac.labels" -}}
helm.sh/chart: {{ include "go-echoafd34f41-f87d-4bc8-807e-0a20bced47ac.chart" . }}
{{ include "go-echoafd34f41-f87d-4bc8-807e-0a20bced47ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoafd34f41-f87d-4bc8-807e-0a20bced47ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoafd34f41-f87d-4bc8-807e-0a20bced47ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
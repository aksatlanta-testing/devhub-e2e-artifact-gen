
{{- define "go-echofc06bd15-5d7a-4cec-b545-f16c3040d4cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc06bd15-5d7a-4cec-b545-f16c3040d4cb.fullname" -}}
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


{{- define "go-echofc06bd15-5d7a-4cec-b545-f16c3040d4cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc06bd15-5d7a-4cec-b545-f16c3040d4cb.labels" -}}
helm.sh/chart: {{ include "go-echofc06bd15-5d7a-4cec-b545-f16c3040d4cb.chart" . }}
{{ include "go-echofc06bd15-5d7a-4cec-b545-f16c3040d4cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc06bd15-5d7a-4cec-b545-f16c3040d4cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc06bd15-5d7a-4cec-b545-f16c3040d4cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
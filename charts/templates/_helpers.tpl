
{{- define "go-echoabc94888-e6b7-46df-9ecb-a139eadae731.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabc94888-e6b7-46df-9ecb-a139eadae731.fullname" -}}
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


{{- define "go-echoabc94888-e6b7-46df-9ecb-a139eadae731.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoabc94888-e6b7-46df-9ecb-a139eadae731.labels" -}}
helm.sh/chart: {{ include "go-echoabc94888-e6b7-46df-9ecb-a139eadae731.chart" . }}
{{ include "go-echoabc94888-e6b7-46df-9ecb-a139eadae731.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoabc94888-e6b7-46df-9ecb-a139eadae731.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoabc94888-e6b7-46df-9ecb-a139eadae731.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
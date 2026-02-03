
{{- define "go-echoec5bbe3a-06a5-4d26-bb13-590344282113.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec5bbe3a-06a5-4d26-bb13-590344282113.fullname" -}}
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


{{- define "go-echoec5bbe3a-06a5-4d26-bb13-590344282113.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoec5bbe3a-06a5-4d26-bb13-590344282113.labels" -}}
helm.sh/chart: {{ include "go-echoec5bbe3a-06a5-4d26-bb13-590344282113.chart" . }}
{{ include "go-echoec5bbe3a-06a5-4d26-bb13-590344282113.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoec5bbe3a-06a5-4d26-bb13-590344282113.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoec5bbe3a-06a5-4d26-bb13-590344282113.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
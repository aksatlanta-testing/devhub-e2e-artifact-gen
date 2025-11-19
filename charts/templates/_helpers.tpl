
{{- define "go-echo9655ac0a-7a8d-43c6-9b6f-4109bf7bd46a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9655ac0a-7a8d-43c6-9b6f-4109bf7bd46a.fullname" -}}
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


{{- define "go-echo9655ac0a-7a8d-43c6-9b6f-4109bf7bd46a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9655ac0a-7a8d-43c6-9b6f-4109bf7bd46a.labels" -}}
helm.sh/chart: {{ include "go-echo9655ac0a-7a8d-43c6-9b6f-4109bf7bd46a.chart" . }}
{{ include "go-echo9655ac0a-7a8d-43c6-9b6f-4109bf7bd46a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9655ac0a-7a8d-43c6-9b6f-4109bf7bd46a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9655ac0a-7a8d-43c6-9b6f-4109bf7bd46a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
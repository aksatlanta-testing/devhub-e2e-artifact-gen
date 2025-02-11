
{{- define "go-echocc9ea8d7-d458-43b0-a07f-c7f99cf6c91b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc9ea8d7-d458-43b0-a07f-c7f99cf6c91b.fullname" -}}
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


{{- define "go-echocc9ea8d7-d458-43b0-a07f-c7f99cf6c91b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc9ea8d7-d458-43b0-a07f-c7f99cf6c91b.labels" -}}
helm.sh/chart: {{ include "go-echocc9ea8d7-d458-43b0-a07f-c7f99cf6c91b.chart" . }}
{{ include "go-echocc9ea8d7-d458-43b0-a07f-c7f99cf6c91b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc9ea8d7-d458-43b0-a07f-c7f99cf6c91b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc9ea8d7-d458-43b0-a07f-c7f99cf6c91b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
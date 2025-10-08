
{{- define "go-echo051a6fe8-ef7a-483e-bec7-3b78b64605ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo051a6fe8-ef7a-483e-bec7-3b78b64605ca.fullname" -}}
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


{{- define "go-echo051a6fe8-ef7a-483e-bec7-3b78b64605ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo051a6fe8-ef7a-483e-bec7-3b78b64605ca.labels" -}}
helm.sh/chart: {{ include "go-echo051a6fe8-ef7a-483e-bec7-3b78b64605ca.chart" . }}
{{ include "go-echo051a6fe8-ef7a-483e-bec7-3b78b64605ca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo051a6fe8-ef7a-483e-bec7-3b78b64605ca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo051a6fe8-ef7a-483e-bec7-3b78b64605ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
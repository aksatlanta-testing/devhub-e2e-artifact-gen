
{{- define "go-echoc0fac7d2-403a-4739-89f1-f6ddc7c6c28d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0fac7d2-403a-4739-89f1-f6ddc7c6c28d.fullname" -}}
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


{{- define "go-echoc0fac7d2-403a-4739-89f1-f6ddc7c6c28d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0fac7d2-403a-4739-89f1-f6ddc7c6c28d.labels" -}}
helm.sh/chart: {{ include "go-echoc0fac7d2-403a-4739-89f1-f6ddc7c6c28d.chart" . }}
{{ include "go-echoc0fac7d2-403a-4739-89f1-f6ddc7c6c28d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0fac7d2-403a-4739-89f1-f6ddc7c6c28d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0fac7d2-403a-4739-89f1-f6ddc7c6c28d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo3878e8a4-080e-45ec-82cc-bece583b38ab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3878e8a4-080e-45ec-82cc-bece583b38ab.fullname" -}}
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


{{- define "go-echo3878e8a4-080e-45ec-82cc-bece583b38ab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3878e8a4-080e-45ec-82cc-bece583b38ab.labels" -}}
helm.sh/chart: {{ include "go-echo3878e8a4-080e-45ec-82cc-bece583b38ab.chart" . }}
{{ include "go-echo3878e8a4-080e-45ec-82cc-bece583b38ab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3878e8a4-080e-45ec-82cc-bece583b38ab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3878e8a4-080e-45ec-82cc-bece583b38ab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
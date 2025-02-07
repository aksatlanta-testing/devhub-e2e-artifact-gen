
{{- define "go-echoa596a658-cb4d-4620-ae1c-2c28c720cdce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa596a658-cb4d-4620-ae1c-2c28c720cdce.fullname" -}}
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


{{- define "go-echoa596a658-cb4d-4620-ae1c-2c28c720cdce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa596a658-cb4d-4620-ae1c-2c28c720cdce.labels" -}}
helm.sh/chart: {{ include "go-echoa596a658-cb4d-4620-ae1c-2c28c720cdce.chart" . }}
{{ include "go-echoa596a658-cb4d-4620-ae1c-2c28c720cdce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa596a658-cb4d-4620-ae1c-2c28c720cdce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa596a658-cb4d-4620-ae1c-2c28c720cdce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
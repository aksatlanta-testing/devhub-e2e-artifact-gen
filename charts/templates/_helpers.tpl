
{{- define "go-echoe2e2025a-8b8f-4a78-92ec-a4f811ac90af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2e2025a-8b8f-4a78-92ec-a4f811ac90af.fullname" -}}
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


{{- define "go-echoe2e2025a-8b8f-4a78-92ec-a4f811ac90af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2e2025a-8b8f-4a78-92ec-a4f811ac90af.labels" -}}
helm.sh/chart: {{ include "go-echoe2e2025a-8b8f-4a78-92ec-a4f811ac90af.chart" . }}
{{ include "go-echoe2e2025a-8b8f-4a78-92ec-a4f811ac90af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe2e2025a-8b8f-4a78-92ec-a4f811ac90af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe2e2025a-8b8f-4a78-92ec-a4f811ac90af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
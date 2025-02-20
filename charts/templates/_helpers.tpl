
{{- define "go-echo070be2a4-f359-4624-a1c0-d4629f84c388.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo070be2a4-f359-4624-a1c0-d4629f84c388.fullname" -}}
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


{{- define "go-echo070be2a4-f359-4624-a1c0-d4629f84c388.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo070be2a4-f359-4624-a1c0-d4629f84c388.labels" -}}
helm.sh/chart: {{ include "go-echo070be2a4-f359-4624-a1c0-d4629f84c388.chart" . }}
{{ include "go-echo070be2a4-f359-4624-a1c0-d4629f84c388.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo070be2a4-f359-4624-a1c0-d4629f84c388.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo070be2a4-f359-4624-a1c0-d4629f84c388.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
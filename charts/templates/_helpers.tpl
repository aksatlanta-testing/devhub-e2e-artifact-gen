
{{- define "go-echoe9a218a4-e967-49eb-8fd4-a0190b441e33.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9a218a4-e967-49eb-8fd4-a0190b441e33.fullname" -}}
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


{{- define "go-echoe9a218a4-e967-49eb-8fd4-a0190b441e33.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe9a218a4-e967-49eb-8fd4-a0190b441e33.labels" -}}
helm.sh/chart: {{ include "go-echoe9a218a4-e967-49eb-8fd4-a0190b441e33.chart" . }}
{{ include "go-echoe9a218a4-e967-49eb-8fd4-a0190b441e33.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe9a218a4-e967-49eb-8fd4-a0190b441e33.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe9a218a4-e967-49eb-8fd4-a0190b441e33.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
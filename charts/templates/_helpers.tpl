
{{- define "go-echoc0e94a03-a5e2-4a99-9c36-4302c0d20f2b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0e94a03-a5e2-4a99-9c36-4302c0d20f2b.fullname" -}}
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


{{- define "go-echoc0e94a03-a5e2-4a99-9c36-4302c0d20f2b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0e94a03-a5e2-4a99-9c36-4302c0d20f2b.labels" -}}
helm.sh/chart: {{ include "go-echoc0e94a03-a5e2-4a99-9c36-4302c0d20f2b.chart" . }}
{{ include "go-echoc0e94a03-a5e2-4a99-9c36-4302c0d20f2b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0e94a03-a5e2-4a99-9c36-4302c0d20f2b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0e94a03-a5e2-4a99-9c36-4302c0d20f2b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
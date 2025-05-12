
{{- define "go-echod7686e3e-496d-4100-be53-0e5320fa0670.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7686e3e-496d-4100-be53-0e5320fa0670.fullname" -}}
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


{{- define "go-echod7686e3e-496d-4100-be53-0e5320fa0670.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7686e3e-496d-4100-be53-0e5320fa0670.labels" -}}
helm.sh/chart: {{ include "go-echod7686e3e-496d-4100-be53-0e5320fa0670.chart" . }}
{{ include "go-echod7686e3e-496d-4100-be53-0e5320fa0670.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7686e3e-496d-4100-be53-0e5320fa0670.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7686e3e-496d-4100-be53-0e5320fa0670.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
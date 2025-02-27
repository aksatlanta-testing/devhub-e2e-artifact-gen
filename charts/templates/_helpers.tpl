
{{- define "go-echo0159d123-c6e2-4eb0-9fa0-7aef64f1bf17.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0159d123-c6e2-4eb0-9fa0-7aef64f1bf17.fullname" -}}
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


{{- define "go-echo0159d123-c6e2-4eb0-9fa0-7aef64f1bf17.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0159d123-c6e2-4eb0-9fa0-7aef64f1bf17.labels" -}}
helm.sh/chart: {{ include "go-echo0159d123-c6e2-4eb0-9fa0-7aef64f1bf17.chart" . }}
{{ include "go-echo0159d123-c6e2-4eb0-9fa0-7aef64f1bf17.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0159d123-c6e2-4eb0-9fa0-7aef64f1bf17.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0159d123-c6e2-4eb0-9fa0-7aef64f1bf17.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
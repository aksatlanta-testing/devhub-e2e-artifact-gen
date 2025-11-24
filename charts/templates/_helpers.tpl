
{{- define "go-echo860c96bd-c507-42c8-b905-a17f1e84bcef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo860c96bd-c507-42c8-b905-a17f1e84bcef.fullname" -}}
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


{{- define "go-echo860c96bd-c507-42c8-b905-a17f1e84bcef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo860c96bd-c507-42c8-b905-a17f1e84bcef.labels" -}}
helm.sh/chart: {{ include "go-echo860c96bd-c507-42c8-b905-a17f1e84bcef.chart" . }}
{{ include "go-echo860c96bd-c507-42c8-b905-a17f1e84bcef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo860c96bd-c507-42c8-b905-a17f1e84bcef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo860c96bd-c507-42c8-b905-a17f1e84bcef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
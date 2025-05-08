
{{- define "go-echof09e917b-15b0-4605-87b4-bd28202871cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof09e917b-15b0-4605-87b4-bd28202871cc.fullname" -}}
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


{{- define "go-echof09e917b-15b0-4605-87b4-bd28202871cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof09e917b-15b0-4605-87b4-bd28202871cc.labels" -}}
helm.sh/chart: {{ include "go-echof09e917b-15b0-4605-87b4-bd28202871cc.chart" . }}
{{ include "go-echof09e917b-15b0-4605-87b4-bd28202871cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof09e917b-15b0-4605-87b4-bd28202871cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof09e917b-15b0-4605-87b4-bd28202871cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
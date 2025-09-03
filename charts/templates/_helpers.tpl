
{{- define "go-echodf1e1f7e-5f1e-45ce-a4fe-5ca4cab58d66.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf1e1f7e-5f1e-45ce-a4fe-5ca4cab58d66.fullname" -}}
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


{{- define "go-echodf1e1f7e-5f1e-45ce-a4fe-5ca4cab58d66.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodf1e1f7e-5f1e-45ce-a4fe-5ca4cab58d66.labels" -}}
helm.sh/chart: {{ include "go-echodf1e1f7e-5f1e-45ce-a4fe-5ca4cab58d66.chart" . }}
{{ include "go-echodf1e1f7e-5f1e-45ce-a4fe-5ca4cab58d66.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodf1e1f7e-5f1e-45ce-a4fe-5ca4cab58d66.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodf1e1f7e-5f1e-45ce-a4fe-5ca4cab58d66.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
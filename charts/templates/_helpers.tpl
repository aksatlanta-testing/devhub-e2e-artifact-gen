
{{- define "go-echodaffd139-687e-4547-b523-cce4a37a82cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodaffd139-687e-4547-b523-cce4a37a82cc.fullname" -}}
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


{{- define "go-echodaffd139-687e-4547-b523-cce4a37a82cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodaffd139-687e-4547-b523-cce4a37a82cc.labels" -}}
helm.sh/chart: {{ include "go-echodaffd139-687e-4547-b523-cce4a37a82cc.chart" . }}
{{ include "go-echodaffd139-687e-4547-b523-cce4a37a82cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodaffd139-687e-4547-b523-cce4a37a82cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodaffd139-687e-4547-b523-cce4a37a82cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
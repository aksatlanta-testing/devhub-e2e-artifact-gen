
{{- define "go-echoed5ff674-89f5-44e6-b231-14b4abde1f64.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed5ff674-89f5-44e6-b231-14b4abde1f64.fullname" -}}
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


{{- define "go-echoed5ff674-89f5-44e6-b231-14b4abde1f64.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed5ff674-89f5-44e6-b231-14b4abde1f64.labels" -}}
helm.sh/chart: {{ include "go-echoed5ff674-89f5-44e6-b231-14b4abde1f64.chart" . }}
{{ include "go-echoed5ff674-89f5-44e6-b231-14b4abde1f64.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed5ff674-89f5-44e6-b231-14b4abde1f64.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed5ff674-89f5-44e6-b231-14b4abde1f64.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
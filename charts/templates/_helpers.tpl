
{{- define "go-echoe8b76cc1-6de3-4cd8-95e8-40838c0085fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8b76cc1-6de3-4cd8-95e8-40838c0085fc.fullname" -}}
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


{{- define "go-echoe8b76cc1-6de3-4cd8-95e8-40838c0085fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8b76cc1-6de3-4cd8-95e8-40838c0085fc.labels" -}}
helm.sh/chart: {{ include "go-echoe8b76cc1-6de3-4cd8-95e8-40838c0085fc.chart" . }}
{{ include "go-echoe8b76cc1-6de3-4cd8-95e8-40838c0085fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe8b76cc1-6de3-4cd8-95e8-40838c0085fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe8b76cc1-6de3-4cd8-95e8-40838c0085fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
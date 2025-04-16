
{{- define "go-echod0ca53b2-df6d-420d-886f-124b4ae8f7be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0ca53b2-df6d-420d-886f-124b4ae8f7be.fullname" -}}
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


{{- define "go-echod0ca53b2-df6d-420d-886f-124b4ae8f7be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0ca53b2-df6d-420d-886f-124b4ae8f7be.labels" -}}
helm.sh/chart: {{ include "go-echod0ca53b2-df6d-420d-886f-124b4ae8f7be.chart" . }}
{{ include "go-echod0ca53b2-df6d-420d-886f-124b4ae8f7be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0ca53b2-df6d-420d-886f-124b4ae8f7be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0ca53b2-df6d-420d-886f-124b4ae8f7be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoa3a267a3-9ac6-456a-b3c0-35a63697b3ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3a267a3-9ac6-456a-b3c0-35a63697b3ee.fullname" -}}
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


{{- define "go-echoa3a267a3-9ac6-456a-b3c0-35a63697b3ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa3a267a3-9ac6-456a-b3c0-35a63697b3ee.labels" -}}
helm.sh/chart: {{ include "go-echoa3a267a3-9ac6-456a-b3c0-35a63697b3ee.chart" . }}
{{ include "go-echoa3a267a3-9ac6-456a-b3c0-35a63697b3ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa3a267a3-9ac6-456a-b3c0-35a63697b3ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa3a267a3-9ac6-456a-b3c0-35a63697b3ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echobdfdd0b4-5798-4fe7-bd1c-bf0ad17a1ebd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdfdd0b4-5798-4fe7-bd1c-bf0ad17a1ebd.fullname" -}}
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


{{- define "go-echobdfdd0b4-5798-4fe7-bd1c-bf0ad17a1ebd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobdfdd0b4-5798-4fe7-bd1c-bf0ad17a1ebd.labels" -}}
helm.sh/chart: {{ include "go-echobdfdd0b4-5798-4fe7-bd1c-bf0ad17a1ebd.chart" . }}
{{ include "go-echobdfdd0b4-5798-4fe7-bd1c-bf0ad17a1ebd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobdfdd0b4-5798-4fe7-bd1c-bf0ad17a1ebd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobdfdd0b4-5798-4fe7-bd1c-bf0ad17a1ebd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
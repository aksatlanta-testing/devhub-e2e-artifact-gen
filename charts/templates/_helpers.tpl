
{{- define "go-echoc958b9cc-23de-4094-b335-272132c194eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc958b9cc-23de-4094-b335-272132c194eb.fullname" -}}
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


{{- define "go-echoc958b9cc-23de-4094-b335-272132c194eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc958b9cc-23de-4094-b335-272132c194eb.labels" -}}
helm.sh/chart: {{ include "go-echoc958b9cc-23de-4094-b335-272132c194eb.chart" . }}
{{ include "go-echoc958b9cc-23de-4094-b335-272132c194eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc958b9cc-23de-4094-b335-272132c194eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc958b9cc-23de-4094-b335-272132c194eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
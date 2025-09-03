
{{- define "go-echod935e344-446d-4a37-84df-f621cb3f10aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod935e344-446d-4a37-84df-f621cb3f10aa.fullname" -}}
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


{{- define "go-echod935e344-446d-4a37-84df-f621cb3f10aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod935e344-446d-4a37-84df-f621cb3f10aa.labels" -}}
helm.sh/chart: {{ include "go-echod935e344-446d-4a37-84df-f621cb3f10aa.chart" . }}
{{ include "go-echod935e344-446d-4a37-84df-f621cb3f10aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod935e344-446d-4a37-84df-f621cb3f10aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod935e344-446d-4a37-84df-f621cb3f10aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
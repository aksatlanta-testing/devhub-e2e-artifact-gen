
{{- define "go-echod4c51798-ce26-46e9-83c0-95c1f9936eb9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4c51798-ce26-46e9-83c0-95c1f9936eb9.fullname" -}}
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


{{- define "go-echod4c51798-ce26-46e9-83c0-95c1f9936eb9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4c51798-ce26-46e9-83c0-95c1f9936eb9.labels" -}}
helm.sh/chart: {{ include "go-echod4c51798-ce26-46e9-83c0-95c1f9936eb9.chart" . }}
{{ include "go-echod4c51798-ce26-46e9-83c0-95c1f9936eb9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod4c51798-ce26-46e9-83c0-95c1f9936eb9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod4c51798-ce26-46e9-83c0-95c1f9936eb9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
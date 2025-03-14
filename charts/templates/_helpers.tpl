
{{- define "go-echod2b50651-7e75-4362-8eb2-fb393a15a120.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2b50651-7e75-4362-8eb2-fb393a15a120.fullname" -}}
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


{{- define "go-echod2b50651-7e75-4362-8eb2-fb393a15a120.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod2b50651-7e75-4362-8eb2-fb393a15a120.labels" -}}
helm.sh/chart: {{ include "go-echod2b50651-7e75-4362-8eb2-fb393a15a120.chart" . }}
{{ include "go-echod2b50651-7e75-4362-8eb2-fb393a15a120.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod2b50651-7e75-4362-8eb2-fb393a15a120.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod2b50651-7e75-4362-8eb2-fb393a15a120.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
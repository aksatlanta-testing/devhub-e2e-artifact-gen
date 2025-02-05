
{{- define "go-echo71a3d5db-b5a4-48a1-b3c5-bbd4acdd207d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71a3d5db-b5a4-48a1-b3c5-bbd4acdd207d.fullname" -}}
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


{{- define "go-echo71a3d5db-b5a4-48a1-b3c5-bbd4acdd207d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71a3d5db-b5a4-48a1-b3c5-bbd4acdd207d.labels" -}}
helm.sh/chart: {{ include "go-echo71a3d5db-b5a4-48a1-b3c5-bbd4acdd207d.chart" . }}
{{ include "go-echo71a3d5db-b5a4-48a1-b3c5-bbd4acdd207d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo71a3d5db-b5a4-48a1-b3c5-bbd4acdd207d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo71a3d5db-b5a4-48a1-b3c5-bbd4acdd207d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
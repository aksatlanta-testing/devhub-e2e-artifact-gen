
{{- define "go-echo2abf628b-6ac0-4e23-aa3c-c837034d490b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2abf628b-6ac0-4e23-aa3c-c837034d490b.fullname" -}}
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


{{- define "go-echo2abf628b-6ac0-4e23-aa3c-c837034d490b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2abf628b-6ac0-4e23-aa3c-c837034d490b.labels" -}}
helm.sh/chart: {{ include "go-echo2abf628b-6ac0-4e23-aa3c-c837034d490b.chart" . }}
{{ include "go-echo2abf628b-6ac0-4e23-aa3c-c837034d490b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2abf628b-6ac0-4e23-aa3c-c837034d490b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2abf628b-6ac0-4e23-aa3c-c837034d490b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
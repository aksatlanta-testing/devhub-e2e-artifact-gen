
{{- define "go-echo589d4565-46cd-4215-ae85-7250c746ee9f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo589d4565-46cd-4215-ae85-7250c746ee9f.fullname" -}}
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


{{- define "go-echo589d4565-46cd-4215-ae85-7250c746ee9f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo589d4565-46cd-4215-ae85-7250c746ee9f.labels" -}}
helm.sh/chart: {{ include "go-echo589d4565-46cd-4215-ae85-7250c746ee9f.chart" . }}
{{ include "go-echo589d4565-46cd-4215-ae85-7250c746ee9f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo589d4565-46cd-4215-ae85-7250c746ee9f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo589d4565-46cd-4215-ae85-7250c746ee9f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
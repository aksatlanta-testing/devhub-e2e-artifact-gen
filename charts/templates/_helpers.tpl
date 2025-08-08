
{{- define "go-echo11c96591-c175-4e36-89fa-5ab5a21cb3ba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo11c96591-c175-4e36-89fa-5ab5a21cb3ba.fullname" -}}
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


{{- define "go-echo11c96591-c175-4e36-89fa-5ab5a21cb3ba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo11c96591-c175-4e36-89fa-5ab5a21cb3ba.labels" -}}
helm.sh/chart: {{ include "go-echo11c96591-c175-4e36-89fa-5ab5a21cb3ba.chart" . }}
{{ include "go-echo11c96591-c175-4e36-89fa-5ab5a21cb3ba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo11c96591-c175-4e36-89fa-5ab5a21cb3ba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo11c96591-c175-4e36-89fa-5ab5a21cb3ba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
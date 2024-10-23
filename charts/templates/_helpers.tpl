
{{- define "go-echob2c0f90f-e14e-499f-9f5d-8abd5ca5a59b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2c0f90f-e14e-499f-9f5d-8abd5ca5a59b.fullname" -}}
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


{{- define "go-echob2c0f90f-e14e-499f-9f5d-8abd5ca5a59b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2c0f90f-e14e-499f-9f5d-8abd5ca5a59b.labels" -}}
helm.sh/chart: {{ include "go-echob2c0f90f-e14e-499f-9f5d-8abd5ca5a59b.chart" . }}
{{ include "go-echob2c0f90f-e14e-499f-9f5d-8abd5ca5a59b.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob2c0f90f-e14e-499f-9f5d-8abd5ca5a59b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob2c0f90f-e14e-499f-9f5d-8abd5ca5a59b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
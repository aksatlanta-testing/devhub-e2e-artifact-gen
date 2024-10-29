
{{- define "go-echo0e4827f9-61ae-421d-973b-28a13ca730cd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e4827f9-61ae-421d-973b-28a13ca730cd.fullname" -}}
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


{{- define "go-echo0e4827f9-61ae-421d-973b-28a13ca730cd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0e4827f9-61ae-421d-973b-28a13ca730cd.labels" -}}
helm.sh/chart: {{ include "go-echo0e4827f9-61ae-421d-973b-28a13ca730cd.chart" . }}
{{ include "go-echo0e4827f9-61ae-421d-973b-28a13ca730cd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0e4827f9-61ae-421d-973b-28a13ca730cd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0e4827f9-61ae-421d-973b-28a13ca730cd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo28179563-496d-49d6-8fe9-679e63c204bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo28179563-496d-49d6-8fe9-679e63c204bf.fullname" -}}
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


{{- define "go-echo28179563-496d-49d6-8fe9-679e63c204bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo28179563-496d-49d6-8fe9-679e63c204bf.labels" -}}
helm.sh/chart: {{ include "go-echo28179563-496d-49d6-8fe9-679e63c204bf.chart" . }}
{{ include "go-echo28179563-496d-49d6-8fe9-679e63c204bf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo28179563-496d-49d6-8fe9-679e63c204bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo28179563-496d-49d6-8fe9-679e63c204bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
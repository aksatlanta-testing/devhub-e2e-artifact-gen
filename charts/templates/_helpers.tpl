
{{- define "go-echo0bf57f35-1ea8-44ba-b04b-88a3237ef708.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0bf57f35-1ea8-44ba-b04b-88a3237ef708.fullname" -}}
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


{{- define "go-echo0bf57f35-1ea8-44ba-b04b-88a3237ef708.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0bf57f35-1ea8-44ba-b04b-88a3237ef708.labels" -}}
helm.sh/chart: {{ include "go-echo0bf57f35-1ea8-44ba-b04b-88a3237ef708.chart" . }}
{{ include "go-echo0bf57f35-1ea8-44ba-b04b-88a3237ef708.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0bf57f35-1ea8-44ba-b04b-88a3237ef708.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0bf57f35-1ea8-44ba-b04b-88a3237ef708.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
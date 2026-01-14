
{{- define "go-echoca0731d9-cdb6-4833-b07d-505cd45f2acf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca0731d9-cdb6-4833-b07d-505cd45f2acf.fullname" -}}
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


{{- define "go-echoca0731d9-cdb6-4833-b07d-505cd45f2acf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoca0731d9-cdb6-4833-b07d-505cd45f2acf.labels" -}}
helm.sh/chart: {{ include "go-echoca0731d9-cdb6-4833-b07d-505cd45f2acf.chart" . }}
{{ include "go-echoca0731d9-cdb6-4833-b07d-505cd45f2acf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoca0731d9-cdb6-4833-b07d-505cd45f2acf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoca0731d9-cdb6-4833-b07d-505cd45f2acf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
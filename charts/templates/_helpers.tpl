
{{- define "go-echoaac20a68-fddf-45f3-9133-094247fa7560.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaac20a68-fddf-45f3-9133-094247fa7560.fullname" -}}
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


{{- define "go-echoaac20a68-fddf-45f3-9133-094247fa7560.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaac20a68-fddf-45f3-9133-094247fa7560.labels" -}}
helm.sh/chart: {{ include "go-echoaac20a68-fddf-45f3-9133-094247fa7560.chart" . }}
{{ include "go-echoaac20a68-fddf-45f3-9133-094247fa7560.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaac20a68-fddf-45f3-9133-094247fa7560.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaac20a68-fddf-45f3-9133-094247fa7560.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
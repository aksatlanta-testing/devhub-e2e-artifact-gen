
{{- define "go-echoda138ba6-c0fe-4ced-b75d-4388f2909e45.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda138ba6-c0fe-4ced-b75d-4388f2909e45.fullname" -}}
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


{{- define "go-echoda138ba6-c0fe-4ced-b75d-4388f2909e45.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda138ba6-c0fe-4ced-b75d-4388f2909e45.labels" -}}
helm.sh/chart: {{ include "go-echoda138ba6-c0fe-4ced-b75d-4388f2909e45.chart" . }}
{{ include "go-echoda138ba6-c0fe-4ced-b75d-4388f2909e45.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda138ba6-c0fe-4ced-b75d-4388f2909e45.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda138ba6-c0fe-4ced-b75d-4388f2909e45.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
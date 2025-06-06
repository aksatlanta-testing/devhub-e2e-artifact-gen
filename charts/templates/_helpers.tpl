
{{- define "go-echof2590549-9b2a-460f-97a7-b990b91186db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2590549-9b2a-460f-97a7-b990b91186db.fullname" -}}
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


{{- define "go-echof2590549-9b2a-460f-97a7-b990b91186db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof2590549-9b2a-460f-97a7-b990b91186db.labels" -}}
helm.sh/chart: {{ include "go-echof2590549-9b2a-460f-97a7-b990b91186db.chart" . }}
{{ include "go-echof2590549-9b2a-460f-97a7-b990b91186db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof2590549-9b2a-460f-97a7-b990b91186db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof2590549-9b2a-460f-97a7-b990b91186db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
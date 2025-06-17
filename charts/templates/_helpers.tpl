
{{- define "go-echod5f9cfed-225e-4579-88b2-5a99208181be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5f9cfed-225e-4579-88b2-5a99208181be.fullname" -}}
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


{{- define "go-echod5f9cfed-225e-4579-88b2-5a99208181be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5f9cfed-225e-4579-88b2-5a99208181be.labels" -}}
helm.sh/chart: {{ include "go-echod5f9cfed-225e-4579-88b2-5a99208181be.chart" . }}
{{ include "go-echod5f9cfed-225e-4579-88b2-5a99208181be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5f9cfed-225e-4579-88b2-5a99208181be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5f9cfed-225e-4579-88b2-5a99208181be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
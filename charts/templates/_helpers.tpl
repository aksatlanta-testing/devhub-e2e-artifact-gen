
{{- define "go-echob93ed16c-f9f1-4725-a2f0-09dc661ad103.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob93ed16c-f9f1-4725-a2f0-09dc661ad103.fullname" -}}
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


{{- define "go-echob93ed16c-f9f1-4725-a2f0-09dc661ad103.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob93ed16c-f9f1-4725-a2f0-09dc661ad103.labels" -}}
helm.sh/chart: {{ include "go-echob93ed16c-f9f1-4725-a2f0-09dc661ad103.chart" . }}
{{ include "go-echob93ed16c-f9f1-4725-a2f0-09dc661ad103.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob93ed16c-f9f1-4725-a2f0-09dc661ad103.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob93ed16c-f9f1-4725-a2f0-09dc661ad103.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
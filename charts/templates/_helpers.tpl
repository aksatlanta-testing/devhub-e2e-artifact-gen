
{{- define "go-echod1e96ec4-d57e-411e-a040-935f33fc136f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1e96ec4-d57e-411e-a040-935f33fc136f.fullname" -}}
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


{{- define "go-echod1e96ec4-d57e-411e-a040-935f33fc136f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod1e96ec4-d57e-411e-a040-935f33fc136f.labels" -}}
helm.sh/chart: {{ include "go-echod1e96ec4-d57e-411e-a040-935f33fc136f.chart" . }}
{{ include "go-echod1e96ec4-d57e-411e-a040-935f33fc136f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod1e96ec4-d57e-411e-a040-935f33fc136f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod1e96ec4-d57e-411e-a040-935f33fc136f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echod4220aef-79a7-4706-a916-94efa2813eca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4220aef-79a7-4706-a916-94efa2813eca.fullname" -}}
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


{{- define "go-echod4220aef-79a7-4706-a916-94efa2813eca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod4220aef-79a7-4706-a916-94efa2813eca.labels" -}}
helm.sh/chart: {{ include "go-echod4220aef-79a7-4706-a916-94efa2813eca.chart" . }}
{{ include "go-echod4220aef-79a7-4706-a916-94efa2813eca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod4220aef-79a7-4706-a916-94efa2813eca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod4220aef-79a7-4706-a916-94efa2813eca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
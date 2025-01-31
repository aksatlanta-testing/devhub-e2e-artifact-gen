
{{- define "go-echo8935eece-12c3-4819-bc71-d26f3af65114.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8935eece-12c3-4819-bc71-d26f3af65114.fullname" -}}
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


{{- define "go-echo8935eece-12c3-4819-bc71-d26f3af65114.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8935eece-12c3-4819-bc71-d26f3af65114.labels" -}}
helm.sh/chart: {{ include "go-echo8935eece-12c3-4819-bc71-d26f3af65114.chart" . }}
{{ include "go-echo8935eece-12c3-4819-bc71-d26f3af65114.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8935eece-12c3-4819-bc71-d26f3af65114.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8935eece-12c3-4819-bc71-d26f3af65114.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
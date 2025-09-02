
{{- define "go-echo6217b259-ab63-4be0-8549-84fbb4990427.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6217b259-ab63-4be0-8549-84fbb4990427.fullname" -}}
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


{{- define "go-echo6217b259-ab63-4be0-8549-84fbb4990427.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6217b259-ab63-4be0-8549-84fbb4990427.labels" -}}
helm.sh/chart: {{ include "go-echo6217b259-ab63-4be0-8549-84fbb4990427.chart" . }}
{{ include "go-echo6217b259-ab63-4be0-8549-84fbb4990427.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6217b259-ab63-4be0-8549-84fbb4990427.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6217b259-ab63-4be0-8549-84fbb4990427.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
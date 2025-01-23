
{{- define "go-echod7f556fd-7fd5-4cdb-9cd3-8534aeb6e3ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7f556fd-7fd5-4cdb-9cd3-8534aeb6e3ff.fullname" -}}
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


{{- define "go-echod7f556fd-7fd5-4cdb-9cd3-8534aeb6e3ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7f556fd-7fd5-4cdb-9cd3-8534aeb6e3ff.labels" -}}
helm.sh/chart: {{ include "go-echod7f556fd-7fd5-4cdb-9cd3-8534aeb6e3ff.chart" . }}
{{ include "go-echod7f556fd-7fd5-4cdb-9cd3-8534aeb6e3ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7f556fd-7fd5-4cdb-9cd3-8534aeb6e3ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7f556fd-7fd5-4cdb-9cd3-8534aeb6e3ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
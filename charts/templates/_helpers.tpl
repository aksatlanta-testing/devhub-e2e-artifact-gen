
{{- define "go-echo6cfdfd73-f2a4-4928-bff6-f037d764e66e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6cfdfd73-f2a4-4928-bff6-f037d764e66e.fullname" -}}
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


{{- define "go-echo6cfdfd73-f2a4-4928-bff6-f037d764e66e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6cfdfd73-f2a4-4928-bff6-f037d764e66e.labels" -}}
helm.sh/chart: {{ include "go-echo6cfdfd73-f2a4-4928-bff6-f037d764e66e.chart" . }}
{{ include "go-echo6cfdfd73-f2a4-4928-bff6-f037d764e66e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6cfdfd73-f2a4-4928-bff6-f037d764e66e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6cfdfd73-f2a4-4928-bff6-f037d764e66e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
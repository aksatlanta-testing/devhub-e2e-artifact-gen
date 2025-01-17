
{{- define "go-echoa80a315a-a354-4dff-84c3-41bbb5bb4f84.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa80a315a-a354-4dff-84c3-41bbb5bb4f84.fullname" -}}
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


{{- define "go-echoa80a315a-a354-4dff-84c3-41bbb5bb4f84.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa80a315a-a354-4dff-84c3-41bbb5bb4f84.labels" -}}
helm.sh/chart: {{ include "go-echoa80a315a-a354-4dff-84c3-41bbb5bb4f84.chart" . }}
{{ include "go-echoa80a315a-a354-4dff-84c3-41bbb5bb4f84.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa80a315a-a354-4dff-84c3-41bbb5bb4f84.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa80a315a-a354-4dff-84c3-41bbb5bb4f84.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo189d054e-84e7-4342-bab1-5f152a4e330c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo189d054e-84e7-4342-bab1-5f152a4e330c.fullname" -}}
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


{{- define "go-echo189d054e-84e7-4342-bab1-5f152a4e330c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo189d054e-84e7-4342-bab1-5f152a4e330c.labels" -}}
helm.sh/chart: {{ include "go-echo189d054e-84e7-4342-bab1-5f152a4e330c.chart" . }}
{{ include "go-echo189d054e-84e7-4342-bab1-5f152a4e330c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo189d054e-84e7-4342-bab1-5f152a4e330c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo189d054e-84e7-4342-bab1-5f152a4e330c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
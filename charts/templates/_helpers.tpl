
{{- define "go-echoa4bab792-f3db-4351-a3da-b2c6acf0584c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4bab792-f3db-4351-a3da-b2c6acf0584c.fullname" -}}
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


{{- define "go-echoa4bab792-f3db-4351-a3da-b2c6acf0584c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4bab792-f3db-4351-a3da-b2c6acf0584c.labels" -}}
helm.sh/chart: {{ include "go-echoa4bab792-f3db-4351-a3da-b2c6acf0584c.chart" . }}
{{ include "go-echoa4bab792-f3db-4351-a3da-b2c6acf0584c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4bab792-f3db-4351-a3da-b2c6acf0584c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4bab792-f3db-4351-a3da-b2c6acf0584c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
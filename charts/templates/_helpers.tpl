
{{- define "go-echoa7d52459-c6be-4443-bdb1-717634267bba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7d52459-c6be-4443-bdb1-717634267bba.fullname" -}}
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


{{- define "go-echoa7d52459-c6be-4443-bdb1-717634267bba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7d52459-c6be-4443-bdb1-717634267bba.labels" -}}
helm.sh/chart: {{ include "go-echoa7d52459-c6be-4443-bdb1-717634267bba.chart" . }}
{{ include "go-echoa7d52459-c6be-4443-bdb1-717634267bba.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa7d52459-c6be-4443-bdb1-717634267bba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa7d52459-c6be-4443-bdb1-717634267bba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
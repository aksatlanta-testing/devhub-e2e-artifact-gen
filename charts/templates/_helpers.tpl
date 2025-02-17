
{{- define "go-echoa9e5ba18-eed3-4af7-a83f-fe1f1bb76dba.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9e5ba18-eed3-4af7-a83f-fe1f1bb76dba.fullname" -}}
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


{{- define "go-echoa9e5ba18-eed3-4af7-a83f-fe1f1bb76dba.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa9e5ba18-eed3-4af7-a83f-fe1f1bb76dba.labels" -}}
helm.sh/chart: {{ include "go-echoa9e5ba18-eed3-4af7-a83f-fe1f1bb76dba.chart" . }}
{{ include "go-echoa9e5ba18-eed3-4af7-a83f-fe1f1bb76dba.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa9e5ba18-eed3-4af7-a83f-fe1f1bb76dba.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa9e5ba18-eed3-4af7-a83f-fe1f1bb76dba.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
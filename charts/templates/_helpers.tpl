
{{- define "go-echoacbcf4f7-f217-49f5-b1d5-cb33895f2f34.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacbcf4f7-f217-49f5-b1d5-cb33895f2f34.fullname" -}}
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


{{- define "go-echoacbcf4f7-f217-49f5-b1d5-cb33895f2f34.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoacbcf4f7-f217-49f5-b1d5-cb33895f2f34.labels" -}}
helm.sh/chart: {{ include "go-echoacbcf4f7-f217-49f5-b1d5-cb33895f2f34.chart" . }}
{{ include "go-echoacbcf4f7-f217-49f5-b1d5-cb33895f2f34.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoacbcf4f7-f217-49f5-b1d5-cb33895f2f34.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoacbcf4f7-f217-49f5-b1d5-cb33895f2f34.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
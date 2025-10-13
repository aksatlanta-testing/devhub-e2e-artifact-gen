
{{- define "go-echod9968c57-c928-4690-bfdb-6b242606cacb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9968c57-c928-4690-bfdb-6b242606cacb.fullname" -}}
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


{{- define "go-echod9968c57-c928-4690-bfdb-6b242606cacb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod9968c57-c928-4690-bfdb-6b242606cacb.labels" -}}
helm.sh/chart: {{ include "go-echod9968c57-c928-4690-bfdb-6b242606cacb.chart" . }}
{{ include "go-echod9968c57-c928-4690-bfdb-6b242606cacb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod9968c57-c928-4690-bfdb-6b242606cacb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod9968c57-c928-4690-bfdb-6b242606cacb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
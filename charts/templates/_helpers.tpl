
{{- define "go-echof000455f-7a98-4f2e-af19-22f1f94de6d2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof000455f-7a98-4f2e-af19-22f1f94de6d2.fullname" -}}
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


{{- define "go-echof000455f-7a98-4f2e-af19-22f1f94de6d2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof000455f-7a98-4f2e-af19-22f1f94de6d2.labels" -}}
helm.sh/chart: {{ include "go-echof000455f-7a98-4f2e-af19-22f1f94de6d2.chart" . }}
{{ include "go-echof000455f-7a98-4f2e-af19-22f1f94de6d2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof000455f-7a98-4f2e-af19-22f1f94de6d2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof000455f-7a98-4f2e-af19-22f1f94de6d2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoadb2dbc9-5a2e-46b1-b096-40d75c4cc17a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadb2dbc9-5a2e-46b1-b096-40d75c4cc17a.fullname" -}}
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


{{- define "go-echoadb2dbc9-5a2e-46b1-b096-40d75c4cc17a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadb2dbc9-5a2e-46b1-b096-40d75c4cc17a.labels" -}}
helm.sh/chart: {{ include "go-echoadb2dbc9-5a2e-46b1-b096-40d75c4cc17a.chart" . }}
{{ include "go-echoadb2dbc9-5a2e-46b1-b096-40d75c4cc17a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoadb2dbc9-5a2e-46b1-b096-40d75c4cc17a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoadb2dbc9-5a2e-46b1-b096-40d75c4cc17a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
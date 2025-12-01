
{{- define "go-echoda30c3ba-e8e9-40ee-bf30-75becbc6a355.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda30c3ba-e8e9-40ee-bf30-75becbc6a355.fullname" -}}
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


{{- define "go-echoda30c3ba-e8e9-40ee-bf30-75becbc6a355.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda30c3ba-e8e9-40ee-bf30-75becbc6a355.labels" -}}
helm.sh/chart: {{ include "go-echoda30c3ba-e8e9-40ee-bf30-75becbc6a355.chart" . }}
{{ include "go-echoda30c3ba-e8e9-40ee-bf30-75becbc6a355.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda30c3ba-e8e9-40ee-bf30-75becbc6a355.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda30c3ba-e8e9-40ee-bf30-75becbc6a355.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
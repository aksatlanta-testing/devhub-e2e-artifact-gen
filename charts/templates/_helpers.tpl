
{{- define "go-echod41e5a50-a47c-4353-ab52-eda83eb415ad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod41e5a50-a47c-4353-ab52-eda83eb415ad.fullname" -}}
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


{{- define "go-echod41e5a50-a47c-4353-ab52-eda83eb415ad.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod41e5a50-a47c-4353-ab52-eda83eb415ad.labels" -}}
helm.sh/chart: {{ include "go-echod41e5a50-a47c-4353-ab52-eda83eb415ad.chart" . }}
{{ include "go-echod41e5a50-a47c-4353-ab52-eda83eb415ad.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod41e5a50-a47c-4353-ab52-eda83eb415ad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod41e5a50-a47c-4353-ab52-eda83eb415ad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
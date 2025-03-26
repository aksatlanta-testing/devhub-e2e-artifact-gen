
{{- define "go-echob42bc339-4b40-4726-a744-69d6c22aa677.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob42bc339-4b40-4726-a744-69d6c22aa677.fullname" -}}
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


{{- define "go-echob42bc339-4b40-4726-a744-69d6c22aa677.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob42bc339-4b40-4726-a744-69d6c22aa677.labels" -}}
helm.sh/chart: {{ include "go-echob42bc339-4b40-4726-a744-69d6c22aa677.chart" . }}
{{ include "go-echob42bc339-4b40-4726-a744-69d6c22aa677.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob42bc339-4b40-4726-a744-69d6c22aa677.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob42bc339-4b40-4726-a744-69d6c22aa677.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
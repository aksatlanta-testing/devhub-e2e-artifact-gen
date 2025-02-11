
{{- define "go-echoc1c41dca-ed94-4823-b792-9d0da04d6faf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1c41dca-ed94-4823-b792-9d0da04d6faf.fullname" -}}
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


{{- define "go-echoc1c41dca-ed94-4823-b792-9d0da04d6faf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc1c41dca-ed94-4823-b792-9d0da04d6faf.labels" -}}
helm.sh/chart: {{ include "go-echoc1c41dca-ed94-4823-b792-9d0da04d6faf.chart" . }}
{{ include "go-echoc1c41dca-ed94-4823-b792-9d0da04d6faf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc1c41dca-ed94-4823-b792-9d0da04d6faf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc1c41dca-ed94-4823-b792-9d0da04d6faf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
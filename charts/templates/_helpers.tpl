
{{- define "go-echof8896944-06be-4497-b1d4-4b0f64c74704.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8896944-06be-4497-b1d4-4b0f64c74704.fullname" -}}
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


{{- define "go-echof8896944-06be-4497-b1d4-4b0f64c74704.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof8896944-06be-4497-b1d4-4b0f64c74704.labels" -}}
helm.sh/chart: {{ include "go-echof8896944-06be-4497-b1d4-4b0f64c74704.chart" . }}
{{ include "go-echof8896944-06be-4497-b1d4-4b0f64c74704.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof8896944-06be-4497-b1d4-4b0f64c74704.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof8896944-06be-4497-b1d4-4b0f64c74704.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
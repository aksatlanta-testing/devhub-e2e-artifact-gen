
{{- define "go-echoc61139bd-f306-4424-91df-a88c4fc9e66c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc61139bd-f306-4424-91df-a88c4fc9e66c.fullname" -}}
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


{{- define "go-echoc61139bd-f306-4424-91df-a88c4fc9e66c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc61139bd-f306-4424-91df-a88c4fc9e66c.labels" -}}
helm.sh/chart: {{ include "go-echoc61139bd-f306-4424-91df-a88c4fc9e66c.chart" . }}
{{ include "go-echoc61139bd-f306-4424-91df-a88c4fc9e66c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc61139bd-f306-4424-91df-a88c4fc9e66c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc61139bd-f306-4424-91df-a88c4fc9e66c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
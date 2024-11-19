
{{- define "go-echoe499999c-a1a3-4f01-a7cc-4e2c75c923fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe499999c-a1a3-4f01-a7cc-4e2c75c923fa.fullname" -}}
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


{{- define "go-echoe499999c-a1a3-4f01-a7cc-4e2c75c923fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe499999c-a1a3-4f01-a7cc-4e2c75c923fa.labels" -}}
helm.sh/chart: {{ include "go-echoe499999c-a1a3-4f01-a7cc-4e2c75c923fa.chart" . }}
{{ include "go-echoe499999c-a1a3-4f01-a7cc-4e2c75c923fa.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe499999c-a1a3-4f01-a7cc-4e2c75c923fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe499999c-a1a3-4f01-a7cc-4e2c75c923fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
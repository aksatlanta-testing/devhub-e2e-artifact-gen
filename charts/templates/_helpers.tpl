
{{- define "go-echo870208e6-1fb9-4f88-b763-411a3c383f65.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo870208e6-1fb9-4f88-b763-411a3c383f65.fullname" -}}
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


{{- define "go-echo870208e6-1fb9-4f88-b763-411a3c383f65.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo870208e6-1fb9-4f88-b763-411a3c383f65.labels" -}}
helm.sh/chart: {{ include "go-echo870208e6-1fb9-4f88-b763-411a3c383f65.chart" . }}
{{ include "go-echo870208e6-1fb9-4f88-b763-411a3c383f65.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo870208e6-1fb9-4f88-b763-411a3c383f65.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo870208e6-1fb9-4f88-b763-411a3c383f65.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
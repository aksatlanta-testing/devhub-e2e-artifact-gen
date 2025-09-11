
{{- define "go-echob27b7d3e-7877-4a61-a1db-047591db3913.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob27b7d3e-7877-4a61-a1db-047591db3913.fullname" -}}
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


{{- define "go-echob27b7d3e-7877-4a61-a1db-047591db3913.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob27b7d3e-7877-4a61-a1db-047591db3913.labels" -}}
helm.sh/chart: {{ include "go-echob27b7d3e-7877-4a61-a1db-047591db3913.chart" . }}
{{ include "go-echob27b7d3e-7877-4a61-a1db-047591db3913.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob27b7d3e-7877-4a61-a1db-047591db3913.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob27b7d3e-7877-4a61-a1db-047591db3913.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
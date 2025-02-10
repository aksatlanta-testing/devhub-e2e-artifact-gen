
{{- define "go-echo6991faf9-1dfe-484f-8aab-5f59f622e7db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6991faf9-1dfe-484f-8aab-5f59f622e7db.fullname" -}}
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


{{- define "go-echo6991faf9-1dfe-484f-8aab-5f59f622e7db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6991faf9-1dfe-484f-8aab-5f59f622e7db.labels" -}}
helm.sh/chart: {{ include "go-echo6991faf9-1dfe-484f-8aab-5f59f622e7db.chart" . }}
{{ include "go-echo6991faf9-1dfe-484f-8aab-5f59f622e7db.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6991faf9-1dfe-484f-8aab-5f59f622e7db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6991faf9-1dfe-484f-8aab-5f59f622e7db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
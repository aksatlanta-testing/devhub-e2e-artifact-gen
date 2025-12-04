
{{- define "go-echod5908cad-72eb-4a15-8e60-435c6840e316.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5908cad-72eb-4a15-8e60-435c6840e316.fullname" -}}
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


{{- define "go-echod5908cad-72eb-4a15-8e60-435c6840e316.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5908cad-72eb-4a15-8e60-435c6840e316.labels" -}}
helm.sh/chart: {{ include "go-echod5908cad-72eb-4a15-8e60-435c6840e316.chart" . }}
{{ include "go-echod5908cad-72eb-4a15-8e60-435c6840e316.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5908cad-72eb-4a15-8e60-435c6840e316.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5908cad-72eb-4a15-8e60-435c6840e316.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
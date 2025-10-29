
{{- define "go-echob89689db-0973-4bb3-8e2b-a83acb70619e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob89689db-0973-4bb3-8e2b-a83acb70619e.fullname" -}}
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


{{- define "go-echob89689db-0973-4bb3-8e2b-a83acb70619e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob89689db-0973-4bb3-8e2b-a83acb70619e.labels" -}}
helm.sh/chart: {{ include "go-echob89689db-0973-4bb3-8e2b-a83acb70619e.chart" . }}
{{ include "go-echob89689db-0973-4bb3-8e2b-a83acb70619e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob89689db-0973-4bb3-8e2b-a83acb70619e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob89689db-0973-4bb3-8e2b-a83acb70619e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
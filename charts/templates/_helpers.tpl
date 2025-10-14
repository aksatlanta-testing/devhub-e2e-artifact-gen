
{{- define "go-echoe4a09ade-5036-43c8-a79e-d417e32596bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe4a09ade-5036-43c8-a79e-d417e32596bf.fullname" -}}
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


{{- define "go-echoe4a09ade-5036-43c8-a79e-d417e32596bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe4a09ade-5036-43c8-a79e-d417e32596bf.labels" -}}
helm.sh/chart: {{ include "go-echoe4a09ade-5036-43c8-a79e-d417e32596bf.chart" . }}
{{ include "go-echoe4a09ade-5036-43c8-a79e-d417e32596bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe4a09ade-5036-43c8-a79e-d417e32596bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe4a09ade-5036-43c8-a79e-d417e32596bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
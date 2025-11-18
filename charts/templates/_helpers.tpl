
{{- define "go-echodebfc90e-2bab-433b-b913-8f0947e22889.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodebfc90e-2bab-433b-b913-8f0947e22889.fullname" -}}
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


{{- define "go-echodebfc90e-2bab-433b-b913-8f0947e22889.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodebfc90e-2bab-433b-b913-8f0947e22889.labels" -}}
helm.sh/chart: {{ include "go-echodebfc90e-2bab-433b-b913-8f0947e22889.chart" . }}
{{ include "go-echodebfc90e-2bab-433b-b913-8f0947e22889.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodebfc90e-2bab-433b-b913-8f0947e22889.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodebfc90e-2bab-433b-b913-8f0947e22889.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
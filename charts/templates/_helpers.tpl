
{{- define "go-echo49fa1323-eaeb-4a81-ade6-5d101a904425.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49fa1323-eaeb-4a81-ade6-5d101a904425.fullname" -}}
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


{{- define "go-echo49fa1323-eaeb-4a81-ade6-5d101a904425.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo49fa1323-eaeb-4a81-ade6-5d101a904425.labels" -}}
helm.sh/chart: {{ include "go-echo49fa1323-eaeb-4a81-ade6-5d101a904425.chart" . }}
{{ include "go-echo49fa1323-eaeb-4a81-ade6-5d101a904425.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo49fa1323-eaeb-4a81-ade6-5d101a904425.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo49fa1323-eaeb-4a81-ade6-5d101a904425.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoa49eafec-5dac-4113-96ca-53b2545bc5eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa49eafec-5dac-4113-96ca-53b2545bc5eb.fullname" -}}
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


{{- define "go-echoa49eafec-5dac-4113-96ca-53b2545bc5eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa49eafec-5dac-4113-96ca-53b2545bc5eb.labels" -}}
helm.sh/chart: {{ include "go-echoa49eafec-5dac-4113-96ca-53b2545bc5eb.chart" . }}
{{ include "go-echoa49eafec-5dac-4113-96ca-53b2545bc5eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa49eafec-5dac-4113-96ca-53b2545bc5eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa49eafec-5dac-4113-96ca-53b2545bc5eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
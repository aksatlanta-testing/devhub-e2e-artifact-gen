
{{- define "go-echo08bf67e4-5531-4f46-a94f-025f9a919606.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08bf67e4-5531-4f46-a94f-025f9a919606.fullname" -}}
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


{{- define "go-echo08bf67e4-5531-4f46-a94f-025f9a919606.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo08bf67e4-5531-4f46-a94f-025f9a919606.labels" -}}
helm.sh/chart: {{ include "go-echo08bf67e4-5531-4f46-a94f-025f9a919606.chart" . }}
{{ include "go-echo08bf67e4-5531-4f46-a94f-025f9a919606.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo08bf67e4-5531-4f46-a94f-025f9a919606.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo08bf67e4-5531-4f46-a94f-025f9a919606.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
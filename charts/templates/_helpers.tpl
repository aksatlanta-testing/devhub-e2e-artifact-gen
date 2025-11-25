
{{- define "go-echo64e5a7d8-7c0c-454a-aca5-d601b389b17b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo64e5a7d8-7c0c-454a-aca5-d601b389b17b.fullname" -}}
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


{{- define "go-echo64e5a7d8-7c0c-454a-aca5-d601b389b17b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo64e5a7d8-7c0c-454a-aca5-d601b389b17b.labels" -}}
helm.sh/chart: {{ include "go-echo64e5a7d8-7c0c-454a-aca5-d601b389b17b.chart" . }}
{{ include "go-echo64e5a7d8-7c0c-454a-aca5-d601b389b17b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo64e5a7d8-7c0c-454a-aca5-d601b389b17b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo64e5a7d8-7c0c-454a-aca5-d601b389b17b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
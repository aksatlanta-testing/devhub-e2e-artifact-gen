
{{- define "go-echo20517d46-c2c9-4ada-b9fc-7b94118984af.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20517d46-c2c9-4ada-b9fc-7b94118984af.fullname" -}}
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


{{- define "go-echo20517d46-c2c9-4ada-b9fc-7b94118984af.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo20517d46-c2c9-4ada-b9fc-7b94118984af.labels" -}}
helm.sh/chart: {{ include "go-echo20517d46-c2c9-4ada-b9fc-7b94118984af.chart" . }}
{{ include "go-echo20517d46-c2c9-4ada-b9fc-7b94118984af.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo20517d46-c2c9-4ada-b9fc-7b94118984af.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo20517d46-c2c9-4ada-b9fc-7b94118984af.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
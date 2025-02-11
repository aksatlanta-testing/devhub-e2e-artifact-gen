
{{- define "go-echo086b4067-e148-4a3f-97b7-fc070bf4cb03.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo086b4067-e148-4a3f-97b7-fc070bf4cb03.fullname" -}}
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


{{- define "go-echo086b4067-e148-4a3f-97b7-fc070bf4cb03.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo086b4067-e148-4a3f-97b7-fc070bf4cb03.labels" -}}
helm.sh/chart: {{ include "go-echo086b4067-e148-4a3f-97b7-fc070bf4cb03.chart" . }}
{{ include "go-echo086b4067-e148-4a3f-97b7-fc070bf4cb03.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo086b4067-e148-4a3f-97b7-fc070bf4cb03.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo086b4067-e148-4a3f-97b7-fc070bf4cb03.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
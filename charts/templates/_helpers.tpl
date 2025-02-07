
{{- define "go-echo2803ec27-b9f2-4600-bc2e-e1684620740b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2803ec27-b9f2-4600-bc2e-e1684620740b.fullname" -}}
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


{{- define "go-echo2803ec27-b9f2-4600-bc2e-e1684620740b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2803ec27-b9f2-4600-bc2e-e1684620740b.labels" -}}
helm.sh/chart: {{ include "go-echo2803ec27-b9f2-4600-bc2e-e1684620740b.chart" . }}
{{ include "go-echo2803ec27-b9f2-4600-bc2e-e1684620740b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2803ec27-b9f2-4600-bc2e-e1684620740b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2803ec27-b9f2-4600-bc2e-e1684620740b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
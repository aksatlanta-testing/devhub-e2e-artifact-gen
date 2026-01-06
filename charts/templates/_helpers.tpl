
{{- define "go-echo93696bf8-f22c-42c6-b050-cd0b556f690d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo93696bf8-f22c-42c6-b050-cd0b556f690d.fullname" -}}
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


{{- define "go-echo93696bf8-f22c-42c6-b050-cd0b556f690d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo93696bf8-f22c-42c6-b050-cd0b556f690d.labels" -}}
helm.sh/chart: {{ include "go-echo93696bf8-f22c-42c6-b050-cd0b556f690d.chart" . }}
{{ include "go-echo93696bf8-f22c-42c6-b050-cd0b556f690d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo93696bf8-f22c-42c6-b050-cd0b556f690d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo93696bf8-f22c-42c6-b050-cd0b556f690d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
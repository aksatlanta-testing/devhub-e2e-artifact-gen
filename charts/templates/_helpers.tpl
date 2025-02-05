
{{- define "go-echo42434e7a-1b7d-4df3-b715-ae22a1b9917d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42434e7a-1b7d-4df3-b715-ae22a1b9917d.fullname" -}}
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


{{- define "go-echo42434e7a-1b7d-4df3-b715-ae22a1b9917d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42434e7a-1b7d-4df3-b715-ae22a1b9917d.labels" -}}
helm.sh/chart: {{ include "go-echo42434e7a-1b7d-4df3-b715-ae22a1b9917d.chart" . }}
{{ include "go-echo42434e7a-1b7d-4df3-b715-ae22a1b9917d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo42434e7a-1b7d-4df3-b715-ae22a1b9917d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo42434e7a-1b7d-4df3-b715-ae22a1b9917d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo9c6fa89f-649d-4f7c-acef-eb9f478e157f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c6fa89f-649d-4f7c-acef-eb9f478e157f.fullname" -}}
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


{{- define "go-echo9c6fa89f-649d-4f7c-acef-eb9f478e157f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c6fa89f-649d-4f7c-acef-eb9f478e157f.labels" -}}
helm.sh/chart: {{ include "go-echo9c6fa89f-649d-4f7c-acef-eb9f478e157f.chart" . }}
{{ include "go-echo9c6fa89f-649d-4f7c-acef-eb9f478e157f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9c6fa89f-649d-4f7c-acef-eb9f478e157f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9c6fa89f-649d-4f7c-acef-eb9f478e157f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
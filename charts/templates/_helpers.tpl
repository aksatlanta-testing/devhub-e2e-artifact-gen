
{{- define "go-echoebd93f49-777f-4d0e-8dd9-93bd164e1468.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebd93f49-777f-4d0e-8dd9-93bd164e1468.fullname" -}}
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


{{- define "go-echoebd93f49-777f-4d0e-8dd9-93bd164e1468.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebd93f49-777f-4d0e-8dd9-93bd164e1468.labels" -}}
helm.sh/chart: {{ include "go-echoebd93f49-777f-4d0e-8dd9-93bd164e1468.chart" . }}
{{ include "go-echoebd93f49-777f-4d0e-8dd9-93bd164e1468.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebd93f49-777f-4d0e-8dd9-93bd164e1468.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebd93f49-777f-4d0e-8dd9-93bd164e1468.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
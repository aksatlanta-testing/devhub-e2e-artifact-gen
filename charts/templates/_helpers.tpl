
{{- define "go-echo46577ca1-be6e-4a16-a020-d068e31b7fcb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo46577ca1-be6e-4a16-a020-d068e31b7fcb.fullname" -}}
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


{{- define "go-echo46577ca1-be6e-4a16-a020-d068e31b7fcb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo46577ca1-be6e-4a16-a020-d068e31b7fcb.labels" -}}
helm.sh/chart: {{ include "go-echo46577ca1-be6e-4a16-a020-d068e31b7fcb.chart" . }}
{{ include "go-echo46577ca1-be6e-4a16-a020-d068e31b7fcb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo46577ca1-be6e-4a16-a020-d068e31b7fcb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo46577ca1-be6e-4a16-a020-d068e31b7fcb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
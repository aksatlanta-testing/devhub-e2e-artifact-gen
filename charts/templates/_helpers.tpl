
{{- define "go-echoc43782a2-1c3e-48f7-a67d-8a56255ceed1.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc43782a2-1c3e-48f7-a67d-8a56255ceed1.fullname" -}}
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


{{- define "go-echoc43782a2-1c3e-48f7-a67d-8a56255ceed1.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc43782a2-1c3e-48f7-a67d-8a56255ceed1.labels" -}}
helm.sh/chart: {{ include "go-echoc43782a2-1c3e-48f7-a67d-8a56255ceed1.chart" . }}
{{ include "go-echoc43782a2-1c3e-48f7-a67d-8a56255ceed1.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc43782a2-1c3e-48f7-a67d-8a56255ceed1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc43782a2-1c3e-48f7-a67d-8a56255ceed1.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
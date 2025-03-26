
{{- define "go-echo0f779c30-e09e-4f7f-aaad-a381f9bc88de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f779c30-e09e-4f7f-aaad-a381f9bc88de.fullname" -}}
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


{{- define "go-echo0f779c30-e09e-4f7f-aaad-a381f9bc88de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f779c30-e09e-4f7f-aaad-a381f9bc88de.labels" -}}
helm.sh/chart: {{ include "go-echo0f779c30-e09e-4f7f-aaad-a381f9bc88de.chart" . }}
{{ include "go-echo0f779c30-e09e-4f7f-aaad-a381f9bc88de.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f779c30-e09e-4f7f-aaad-a381f9bc88de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f779c30-e09e-4f7f-aaad-a381f9bc88de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
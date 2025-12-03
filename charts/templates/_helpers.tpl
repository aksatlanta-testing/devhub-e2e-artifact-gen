
{{- define "go-echof133abe5-f073-4a72-952b-e6d77c0c2157.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof133abe5-f073-4a72-952b-e6d77c0c2157.fullname" -}}
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


{{- define "go-echof133abe5-f073-4a72-952b-e6d77c0c2157.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof133abe5-f073-4a72-952b-e6d77c0c2157.labels" -}}
helm.sh/chart: {{ include "go-echof133abe5-f073-4a72-952b-e6d77c0c2157.chart" . }}
{{ include "go-echof133abe5-f073-4a72-952b-e6d77c0c2157.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof133abe5-f073-4a72-952b-e6d77c0c2157.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof133abe5-f073-4a72-952b-e6d77c0c2157.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
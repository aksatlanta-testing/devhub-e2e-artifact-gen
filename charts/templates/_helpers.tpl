
{{- define "go-echoa927d332-0852-411c-b597-96a6292764fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa927d332-0852-411c-b597-96a6292764fc.fullname" -}}
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


{{- define "go-echoa927d332-0852-411c-b597-96a6292764fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa927d332-0852-411c-b597-96a6292764fc.labels" -}}
helm.sh/chart: {{ include "go-echoa927d332-0852-411c-b597-96a6292764fc.chart" . }}
{{ include "go-echoa927d332-0852-411c-b597-96a6292764fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa927d332-0852-411c-b597-96a6292764fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa927d332-0852-411c-b597-96a6292764fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
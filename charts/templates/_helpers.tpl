
{{- define "go-echo32c2d4ca-2027-4d96-bd51-5f762c1e667f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32c2d4ca-2027-4d96-bd51-5f762c1e667f.fullname" -}}
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


{{- define "go-echo32c2d4ca-2027-4d96-bd51-5f762c1e667f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32c2d4ca-2027-4d96-bd51-5f762c1e667f.labels" -}}
helm.sh/chart: {{ include "go-echo32c2d4ca-2027-4d96-bd51-5f762c1e667f.chart" . }}
{{ include "go-echo32c2d4ca-2027-4d96-bd51-5f762c1e667f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo32c2d4ca-2027-4d96-bd51-5f762c1e667f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo32c2d4ca-2027-4d96-bd51-5f762c1e667f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
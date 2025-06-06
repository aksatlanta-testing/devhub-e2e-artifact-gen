
{{- define "go-echo3368ee32-1990-4cc1-bc6e-ab6647c7afac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3368ee32-1990-4cc1-bc6e-ab6647c7afac.fullname" -}}
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


{{- define "go-echo3368ee32-1990-4cc1-bc6e-ab6647c7afac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3368ee32-1990-4cc1-bc6e-ab6647c7afac.labels" -}}
helm.sh/chart: {{ include "go-echo3368ee32-1990-4cc1-bc6e-ab6647c7afac.chart" . }}
{{ include "go-echo3368ee32-1990-4cc1-bc6e-ab6647c7afac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3368ee32-1990-4cc1-bc6e-ab6647c7afac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3368ee32-1990-4cc1-bc6e-ab6647c7afac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
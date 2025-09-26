
{{- define "go-echo0499a120-ef4e-44fa-ab95-99fb47589714.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0499a120-ef4e-44fa-ab95-99fb47589714.fullname" -}}
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


{{- define "go-echo0499a120-ef4e-44fa-ab95-99fb47589714.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0499a120-ef4e-44fa-ab95-99fb47589714.labels" -}}
helm.sh/chart: {{ include "go-echo0499a120-ef4e-44fa-ab95-99fb47589714.chart" . }}
{{ include "go-echo0499a120-ef4e-44fa-ab95-99fb47589714.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0499a120-ef4e-44fa-ab95-99fb47589714.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0499a120-ef4e-44fa-ab95-99fb47589714.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
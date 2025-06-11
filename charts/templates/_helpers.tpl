
{{- define "go-echofb2deec0-4bcd-4937-97f1-dc15db224d37.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb2deec0-4bcd-4937-97f1-dc15db224d37.fullname" -}}
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


{{- define "go-echofb2deec0-4bcd-4937-97f1-dc15db224d37.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb2deec0-4bcd-4937-97f1-dc15db224d37.labels" -}}
helm.sh/chart: {{ include "go-echofb2deec0-4bcd-4937-97f1-dc15db224d37.chart" . }}
{{ include "go-echofb2deec0-4bcd-4937-97f1-dc15db224d37.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb2deec0-4bcd-4937-97f1-dc15db224d37.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb2deec0-4bcd-4937-97f1-dc15db224d37.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
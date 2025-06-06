
{{- define "go-echofbb982de-1bce-4145-904d-2a4251a9e449.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbb982de-1bce-4145-904d-2a4251a9e449.fullname" -}}
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


{{- define "go-echofbb982de-1bce-4145-904d-2a4251a9e449.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofbb982de-1bce-4145-904d-2a4251a9e449.labels" -}}
helm.sh/chart: {{ include "go-echofbb982de-1bce-4145-904d-2a4251a9e449.chart" . }}
{{ include "go-echofbb982de-1bce-4145-904d-2a4251a9e449.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofbb982de-1bce-4145-904d-2a4251a9e449.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofbb982de-1bce-4145-904d-2a4251a9e449.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
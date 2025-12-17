
{{- define "go-echobfee5245-18f7-4c70-b245-bdbd83c26b75.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfee5245-18f7-4c70-b245-bdbd83c26b75.fullname" -}}
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


{{- define "go-echobfee5245-18f7-4c70-b245-bdbd83c26b75.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfee5245-18f7-4c70-b245-bdbd83c26b75.labels" -}}
helm.sh/chart: {{ include "go-echobfee5245-18f7-4c70-b245-bdbd83c26b75.chart" . }}
{{ include "go-echobfee5245-18f7-4c70-b245-bdbd83c26b75.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobfee5245-18f7-4c70-b245-bdbd83c26b75.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobfee5245-18f7-4c70-b245-bdbd83c26b75.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echodba312bc-ed21-4dcf-b50c-a164d884478d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodba312bc-ed21-4dcf-b50c-a164d884478d.fullname" -}}
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


{{- define "go-echodba312bc-ed21-4dcf-b50c-a164d884478d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodba312bc-ed21-4dcf-b50c-a164d884478d.labels" -}}
helm.sh/chart: {{ include "go-echodba312bc-ed21-4dcf-b50c-a164d884478d.chart" . }}
{{ include "go-echodba312bc-ed21-4dcf-b50c-a164d884478d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodba312bc-ed21-4dcf-b50c-a164d884478d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodba312bc-ed21-4dcf-b50c-a164d884478d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
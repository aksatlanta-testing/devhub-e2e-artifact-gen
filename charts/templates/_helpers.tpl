
{{- define "go-echob2438a54-d0a1-49c1-b6a4-dff2df4e7287.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2438a54-d0a1-49c1-b6a4-dff2df4e7287.fullname" -}}
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


{{- define "go-echob2438a54-d0a1-49c1-b6a4-dff2df4e7287.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2438a54-d0a1-49c1-b6a4-dff2df4e7287.labels" -}}
helm.sh/chart: {{ include "go-echob2438a54-d0a1-49c1-b6a4-dff2df4e7287.chart" . }}
{{ include "go-echob2438a54-d0a1-49c1-b6a4-dff2df4e7287.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob2438a54-d0a1-49c1-b6a4-dff2df4e7287.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob2438a54-d0a1-49c1-b6a4-dff2df4e7287.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
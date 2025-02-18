
{{- define "go-echob4263a36-ff37-4e3e-b080-2db73cb2cd11.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4263a36-ff37-4e3e-b080-2db73cb2cd11.fullname" -}}
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


{{- define "go-echob4263a36-ff37-4e3e-b080-2db73cb2cd11.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob4263a36-ff37-4e3e-b080-2db73cb2cd11.labels" -}}
helm.sh/chart: {{ include "go-echob4263a36-ff37-4e3e-b080-2db73cb2cd11.chart" . }}
{{ include "go-echob4263a36-ff37-4e3e-b080-2db73cb2cd11.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob4263a36-ff37-4e3e-b080-2db73cb2cd11.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob4263a36-ff37-4e3e-b080-2db73cb2cd11.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
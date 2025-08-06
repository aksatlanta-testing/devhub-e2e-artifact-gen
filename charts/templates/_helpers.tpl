
{{- define "go-echoaae1d3bb-04f8-44ba-a4d1-821c4869bf7f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaae1d3bb-04f8-44ba-a4d1-821c4869bf7f.fullname" -}}
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


{{- define "go-echoaae1d3bb-04f8-44ba-a4d1-821c4869bf7f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaae1d3bb-04f8-44ba-a4d1-821c4869bf7f.labels" -}}
helm.sh/chart: {{ include "go-echoaae1d3bb-04f8-44ba-a4d1-821c4869bf7f.chart" . }}
{{ include "go-echoaae1d3bb-04f8-44ba-a4d1-821c4869bf7f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaae1d3bb-04f8-44ba-a4d1-821c4869bf7f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaae1d3bb-04f8-44ba-a4d1-821c4869bf7f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echo0f2c05f7-5068-418a-8b16-b351ef04efce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f2c05f7-5068-418a-8b16-b351ef04efce.fullname" -}}
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


{{- define "go-echo0f2c05f7-5068-418a-8b16-b351ef04efce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f2c05f7-5068-418a-8b16-b351ef04efce.labels" -}}
helm.sh/chart: {{ include "go-echo0f2c05f7-5068-418a-8b16-b351ef04efce.chart" . }}
{{ include "go-echo0f2c05f7-5068-418a-8b16-b351ef04efce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f2c05f7-5068-418a-8b16-b351ef04efce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f2c05f7-5068-418a-8b16-b351ef04efce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
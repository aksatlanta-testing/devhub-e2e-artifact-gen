
{{- define "go-echoc5657094-b134-468f-916d-25f9611a668e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5657094-b134-468f-916d-25f9611a668e.fullname" -}}
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


{{- define "go-echoc5657094-b134-468f-916d-25f9611a668e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc5657094-b134-468f-916d-25f9611a668e.labels" -}}
helm.sh/chart: {{ include "go-echoc5657094-b134-468f-916d-25f9611a668e.chart" . }}
{{ include "go-echoc5657094-b134-468f-916d-25f9611a668e.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc5657094-b134-468f-916d-25f9611a668e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc5657094-b134-468f-916d-25f9611a668e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "go-echoa355b4e9-8eee-439c-8775-b4e2399809dc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa355b4e9-8eee-439c-8775-b4e2399809dc.fullname" -}}
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


{{- define "go-echoa355b4e9-8eee-439c-8775-b4e2399809dc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa355b4e9-8eee-439c-8775-b4e2399809dc.labels" -}}
helm.sh/chart: {{ include "go-echoa355b4e9-8eee-439c-8775-b4e2399809dc.chart" . }}
{{ include "go-echoa355b4e9-8eee-439c-8775-b4e2399809dc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa355b4e9-8eee-439c-8775-b4e2399809dc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa355b4e9-8eee-439c-8775-b4e2399809dc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
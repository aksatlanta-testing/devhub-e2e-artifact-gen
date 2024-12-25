
{{- define "go-echo57811cfb-fca9-424f-8733-410f1f0e114f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57811cfb-fca9-424f-8733-410f1f0e114f.fullname" -}}
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


{{- define "go-echo57811cfb-fca9-424f-8733-410f1f0e114f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo57811cfb-fca9-424f-8733-410f1f0e114f.labels" -}}
helm.sh/chart: {{ include "go-echo57811cfb-fca9-424f-8733-410f1f0e114f.chart" . }}
{{ include "go-echo57811cfb-fca9-424f-8733-410f1f0e114f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo57811cfb-fca9-424f-8733-410f1f0e114f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo57811cfb-fca9-424f-8733-410f1f0e114f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
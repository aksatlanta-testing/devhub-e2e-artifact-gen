
{{- define "go-echo2d1a818a-eb32-4e6e-9c1e-20bfedfd495f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d1a818a-eb32-4e6e-9c1e-20bfedfd495f.fullname" -}}
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


{{- define "go-echo2d1a818a-eb32-4e6e-9c1e-20bfedfd495f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2d1a818a-eb32-4e6e-9c1e-20bfedfd495f.labels" -}}
helm.sh/chart: {{ include "go-echo2d1a818a-eb32-4e6e-9c1e-20bfedfd495f.chart" . }}
{{ include "go-echo2d1a818a-eb32-4e6e-9c1e-20bfedfd495f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2d1a818a-eb32-4e6e-9c1e-20bfedfd495f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2d1a818a-eb32-4e6e-9c1e-20bfedfd495f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
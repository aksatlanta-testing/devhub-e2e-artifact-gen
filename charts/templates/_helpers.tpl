
{{- define "go-echo3d0f3b8a-60da-40f5-a4e8-4875cfff1061.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d0f3b8a-60da-40f5-a4e8-4875cfff1061.fullname" -}}
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


{{- define "go-echo3d0f3b8a-60da-40f5-a4e8-4875cfff1061.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3d0f3b8a-60da-40f5-a4e8-4875cfff1061.labels" -}}
helm.sh/chart: {{ include "go-echo3d0f3b8a-60da-40f5-a4e8-4875cfff1061.chart" . }}
{{ include "go-echo3d0f3b8a-60da-40f5-a4e8-4875cfff1061.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3d0f3b8a-60da-40f5-a4e8-4875cfff1061.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3d0f3b8a-60da-40f5-a4e8-4875cfff1061.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
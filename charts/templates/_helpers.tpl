
{{- define "go-echo92924b2a-bd43-40f2-baad-ecdeaa186dd3.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92924b2a-bd43-40f2-baad-ecdeaa186dd3.fullname" -}}
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


{{- define "go-echo92924b2a-bd43-40f2-baad-ecdeaa186dd3.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92924b2a-bd43-40f2-baad-ecdeaa186dd3.labels" -}}
helm.sh/chart: {{ include "go-echo92924b2a-bd43-40f2-baad-ecdeaa186dd3.chart" . }}
{{ include "go-echo92924b2a-bd43-40f2-baad-ecdeaa186dd3.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo92924b2a-bd43-40f2-baad-ecdeaa186dd3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo92924b2a-bd43-40f2-baad-ecdeaa186dd3.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
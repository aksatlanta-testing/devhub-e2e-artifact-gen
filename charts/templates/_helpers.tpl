
{{- define "go-echoaedd6c4c-f40b-448a-a376-8c91b220b24f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaedd6c4c-f40b-448a-a376-8c91b220b24f.fullname" -}}
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


{{- define "go-echoaedd6c4c-f40b-448a-a376-8c91b220b24f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaedd6c4c-f40b-448a-a376-8c91b220b24f.labels" -}}
helm.sh/chart: {{ include "go-echoaedd6c4c-f40b-448a-a376-8c91b220b24f.chart" . }}
{{ include "go-echoaedd6c4c-f40b-448a-a376-8c91b220b24f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaedd6c4c-f40b-448a-a376-8c91b220b24f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaedd6c4c-f40b-448a-a376-8c91b220b24f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}